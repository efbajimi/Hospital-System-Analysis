# Hospital Revenue & Operations Analysis (SQL + Tableau)

## Objectives
The objective of this project was to analyze hospital operational data to uncover revenue trends, payment behavior, treatment demand, and appointment patterns. 

This project was designed to simulate a real-world healthcare analytics scenario and demonstrate my ability to:
- Query and analyze relational datasets using SQL
- Extract business insights from operational data
- Build dashboards to communicate findings visually
- Translate raw data into actionable business recommendations

---

## Overview
In this project, I analyzed hospital management system (HMS) data containing patient, billing, treatment, doctor, and appointment records. Using SQL and Tableau, I explored revenue distribution, treatment performance, and operational inefficiencies such as failed payments and missed appointments.

This project demonstrates my ability to work with structured data, perform analytical queries, and present findings in a way that supports decision-making.

---

## Tools & Technologies
- SQL (Joins, Aggregations, Filtering, Grouping, Subqueries)
- Tableau (Dashboard development and visualization)
- Excel (Dataset storage and preparation)

---

## Dataset
The dataset includes:
- Patient records
- Billing transactions
- Treatment data
- Appointment scheduling data
- Doctor and branch information

---

## Key Insights
- A significant portion of revenue is tied to failed or pending payments, indicating potential revenue recovery opportunities.
- Certain treatments consistently generate higher revenue and patient demand.
- Branch-level revenue differences suggest opportunities for operational optimization.
- Missed and cancelled appointments represent lost utilization capacity.
  
---

## Business Impact
- This analysis could help hospital administrators:
- Improve revenue collection by identifying failed payments early
- Optimize scheduling and reduce no-shows
- Allocate resources toward high-demand treatments
- Compare branch performance to improve operational efficiency
- By turning operational data into insights, organizations can reduce revenue leakage, improve patient flow, and make more informed strategic decisions.

---

## SQL Analysis Performed

### Revenue by Payment Status
```sql
select round(sum(amount)) as paid_payment
from billing
where payment_status = "Paid"
group by payment_status;

select round(sum(amount)) as pending_payment
from billing
where payment_status = "pending"
group by payment_status;

select round(sum(amount)) as Failed_payment
from billing
where payment_status = "Failed"
group by payment_status;
```
### Purpose:
- Identify revenue collected vs. delayed or lost payments.

---

### Failed Payments by Patient
```sql
select billing.bill_id,
billing.patient_id,
patients.first_name,
patients.last_name,
patients.contact_number,
patients.email,
patients.insurance_provider,
patients.insurance_number,
billing.bill_date,
billing.amount,
billing.payment_status
from patients
join billing
on billing.patient_id = patients.patient_id
where billing.payment_status = "failed";
```
### Purpose:
- Identify patients with failed payments and analyze potential revenue leakage.

---

### Treatment Demand Analysis
```sql
select treatment_type, count(treatment_type) as numberoftimes
from treatment
group by treatment_type
order by numberoftimes desc;
```
### Purpose:
- Determine which treatments generate the most demand and revenue potential.

---

### Appointment Attendance Analysis
```sql
select appointments.patient_id,
patients.first_name,
patients.last_name,
patients.contact_number,
patients.email,
appointments.appointment_id,
appointments.appointment_date,
appointments.appointment_time,
appointments.reason_for_visit,
appointments.status
from appointments
join patients
on appointments.patient_id = patients.patient_id
where appointments.status = "No-show" or appointments.status = "Cancelled";
```
### Purpose:
- Identify operational inefficiencies caused by missed or cancelled appointments.

---

### Tableau Dashboard

<img width="1940" height="1177" alt="image" src="https://github.com/user-attachments/assets/490cd495-cb5f-44b2-ad0e-51c351992de5" />

- The dashboard visualizes:
- Total revenue and payment status breakdown
- Revenue per hospital branch
- Revenue by treatment type
- Doctor distribution by branch
- Payment status trends and failed transactions
#### These visualizations allow stakeholders to quickly identify performance patterns and operational risks.
