# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
specialty_array = ["Critical care medicine", "Hospice and palliative care", "Pain medicine", "Pediatric anesthesiology", "Sleep medicine", "Dermatopathology", "Pediatric dermatology", "Procedural dermatology", "Abdominal radiology", "Breast imaging", "Cardiothoracic radiology", "Cardiovascular radiology", "Chest radiology", "Emergency radiology", "Endovascular surgical neuroradiology", "Gastrointestinal radiology", "Genitourinary radiology", "Head and neck radiology", "Interventional radiology", "Musculoskeletal radiology", "Neuroradiology", "Nuclear radiology", "Pediatric radiology", "Radiation oncology", "Vascular and interventional radiology", "Anesthesiology critical care medicine", "Emergency medical services", "Hospice and palliative medicine", "Internal medicine / Critical care medicine", "Medical toxicology", "Pain medicine", "Pediatric emergency medicine", "Sports medicine", "Undersea and hyperbaric medicine", "Adolescent medicine", "Geriatric medicine", "Hospice and palliative medicine", "Pain medicine", "Sleep medicine", "Sports medicine", "Advanced heart failure and transplant cardiology", "Cardiovascular disease", "Clinical cardiac electrophysiology", "Critical care medicine", "Endocrinology, diabetes, and metabolism", "Gastroenterology", "Geriatric medicine", "Hematology", "Hematology and oncology", "Infectious disease", "Internal medicine", "Interventional cardiology", "Nephrology", "Oncology", "Pediatric internal medicine", "Pulmonary disease", "Pulmonary disease and critical care medicine", "Rheumatology", "Sleep medicine", "Sports medicine", "Transplant hepatology", "Biochemical genetics", "Clinical cytogenetics", "Clinical genetics", "Molecular genetic pathology", "Brain injury medicine", "Child neurology", "Clinical neurophysiology", "Endovascular surgical neuroradiology", "Hospice and palliative medicine", "Neurodevelopmental disabilities", "Neuromuscular medicine", "Pain medicine", "Sleep medicine", "Vascular neurology", "Female pelvic medicine and reconstructive surgery", "Gynecologic oncology", "Maternal-fetal medicine", "Reproductive endocrinologists and infertility", "Anterior segment/cornea ophthalmology", "Glaucoma ophthalmology", "Neuro-ophthalmology", "Ocular oncology", "Oculoplastics/orbit", "Ophthalmic Plastic & Reconstructive Surgery", "Retina/uveitis", "Strabismus/pediatric ophthalmology", "Anatomical pathology", "Blood banking and transfusion medicine", "Chemical pathology", "Clinical pathology", "Cytopathology", "Forensic pathology", "Genetic pathology", "Hematology", "Immunopathology", "Medical microbiology", "Molecular pathology", "Neuropathology", "Pediatric pathology", "Adolescent medicine", "Child abuse pediatrics", "Developmental-behavioral pediatrics", "Neonatal-perinatal medicine", "Pediatric cardiology", "Pediatric critical care medicine", "Pediatric endocrinology", "Pediatric gastroenterology", "Pediatric hematology-oncology", "Pediatric infectious diseases", "Pediatric nephrology", "Pediatric pulmonology", "Pediatric rheumatology", "Pediatric sports medicine", "Pediatric transplant hepatology", "Brain injury medicine", "Hospice and palliative medicine", "Neuromuscular medicine", "Pain medicine", "Pediatric rehabilitation medicine", "Spinal cord injury medicine", "Sports medicine", "Aerospace medicine", "Medical toxicology", "Occupational medicine", "Public health medicine", "Addiction psychiatry", "Administrative psychiatry", "Child and adolescent psychiatry", "Community psychiatry", "Consultation/liaison psychiatry", "Emergency psychiatry", "Forensic psychiatry", "Geriatric psychiatry", "Mental retardation psychiatry", "Military psychiatry", "Pain medicine", "Psychiatric research", "Psychosomatic medicine", "Hospice and palliative medicine", "Pain medicine", "Colon and rectal surgery", "General surgery", "Surgical critical care", "Gynecologic oncology", "Plastic surgery", "Craniofacial surgery", "Hand surgery", "Neurological surgery", "Endovascular surgical neuroradiology", "Ophthalmic surgery", "Oral and maxillofacial surgery", "Orthopaedic surgery", "Adult reconstructive orthopaedics", "Foot and ankle orthopaedics", "Musculoskeletal oncology", "Orthopaedic sports medicine", "Orthopaedic surgery of the spine", "Orthopaedic trauma", "Pediatric orthopaedics", "Otolaryngology", "Pediatric otolaryngology", "Otology neurotology", "Pediatric surgery", "Neonatal", "Prenatal", "Trauma", "Pediatric oncology", "Surgical Intensivists, specializing in critical care patients", "Thoracic Surgery", "Congenital cardiac surgery", "Thoracic surgery-integrated", "Vascular surgery", "Pediatric urology", "Urologic oncology", "Renal transplant", "Male infertility", "Calculi", "Female urology", "Neurourology"]

Doctor.destroy_all
Specialty.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
JoinTable.destroy_all

specialty_array.each do |line|
 specialty = Specialty.create(name: line)
end

10.times do
  city = City.create(name: Faker::Address.city)
end

100.times do
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Number.within(range: 34000..75000), city: City.all.sample)
end

200.times do
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
end

150.times do
  doc1 = Doctor.all.sample
  sp1 = Specialty.all.sample
  doc1.specialties << sp1
  doc2 = Doctor.all.sample
  sp2 = Specialty.all.sample
  sp2.doctors << doc2
end

360.times do
  appointment_city = City.all.sample
  appointment = Appointment.create(date: Faker::Date.forward(days: 365), doctor: Doctor.where(city: appointment_city).sample, patient: Patient.where(city: appointment_city).sample, city: appointment_city)
end


