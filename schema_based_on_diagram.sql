CREATE TABLE "patients"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);
ALTER TABLE
    "patients" ADD PRIMARY KEY("id");
CREATE INDEX "patients_name_index" ON
    "patients"("name" ASC);
CREATE TABLE "medical_histories"(
    "id" INTEGER NOT NULL,
    "admitted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "medical_histories" ADD PRIMARY KEY("id");
CREATE INDEX "medical_histories_patient_id_index" ON
    "medical_histories"("patient_id" ASC);
CREATE TABLE "treatments"(
    "id" INTEGER NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "treatments" ADD PRIMARY KEY("id");
CREATE TABLE "invoice_items"(
    "id" INTEGER NOT NULL,
    "unite_price" DECIMAL(8, 2) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL
);
ALTER TABLE
    "invoice_items" ADD PRIMARY KEY("id");
CREATE INDEX "invoice_items_invoice_id_index" ON
    "invoice_items"("invoice_id" ASC);
CREATE TABLE "invoices"(
    "id" INTEGER NOT NULL,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL
);
ALTER TABLE
    "invoices" ADD PRIMARY KEY("id");
CREATE INDEX "invoices_medical_history_id_index" ON
    "invoices"("medical_history_id" ASC);
CREATE TABLE "medical_history_treatments"(
    "medical_history_id" INTEGER NOT NULL,
    "treatments_id" INTEGER NOT NULL
);
CREATE INDEX "medical_history_treatments_medical_history_id_index" ON
    "medical_history_treatments"("medical_history_id" ASC);
CREATE INDEX "medical_history_treatments_treatments_id_index" ON
    "medical_history_treatments"("treatments_id" ASC);