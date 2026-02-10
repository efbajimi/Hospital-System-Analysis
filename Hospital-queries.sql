-- find the total amount of revenue where the payment is successful
select round(sum(amount)) as paid_payment
from billing
where payment_status = "Paid"
group by payment_status 

-- find the total amount of potential revenue where the payment is pending
select round(sum(amount)) as pending_payment
from billing
where payment_status = "pending"
group by payment_status

-- find the total amount of potential revenue where the payment status is failed
select round(sum(amount)) as Failed_payment
from billing
where payment_status = "Failed"
group by payment_status

--select all the relevant information of the paitent that have failed status
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
where billing.payment_status = "failed"

-- find the most common treatment type 
select treatment_type, count(treatment_type) as numberoftimes
from treatment
group by treatment_type 
order by numberoftimes desc

-- select relevant information of paitient that failed to come in for thier appointment or cancelled
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
where appointments.status = "No-show" or appointments.status = "Cancelled"