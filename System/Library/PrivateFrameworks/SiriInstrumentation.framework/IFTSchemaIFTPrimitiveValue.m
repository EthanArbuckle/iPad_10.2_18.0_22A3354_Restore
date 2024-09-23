@implementation IFTSchemaIFTPrimitiveValue

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IFTSchemaIFTPrimitiveValue;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v31, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTPrimitiveValue primitiveDateComponents](self, "primitiveDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTPrimitiveValue deletePrimitiveDateComponents](self, "deletePrimitiveDateComponents");
  -[IFTSchemaIFTPrimitiveValue measurement](self, "measurement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTPrimitiveValue deleteMeasurement](self, "deleteMeasurement");
  -[IFTSchemaIFTPrimitiveValue currencyAmount](self, "currencyAmount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTPrimitiveValue deleteCurrencyAmount](self, "deleteCurrencyAmount");
  -[IFTSchemaIFTPrimitiveValue paymentMethod](self, "paymentMethod");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTPrimitiveValue deletePaymentMethod](self, "deletePaymentMethod");
  -[IFTSchemaIFTPrimitiveValue placemark](self, "placemark");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[IFTSchemaIFTPrimitiveValue deletePlacemark](self, "deletePlacemark");
  -[IFTSchemaIFTPrimitiveValue person](self, "person");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[IFTSchemaIFTPrimitiveValue deletePerson](self, "deletePerson");
  -[IFTSchemaIFTPrimitiveValue file](self, "file");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[IFTSchemaIFTPrimitiveValue deleteFile](self, "deleteFile");
  -[IFTSchemaIFTPrimitiveValue app](self, "app");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[IFTSchemaIFTPrimitiveValue deleteApp](self, "deleteApp");

  return v5;
}

- (void)setPrimitiveNull:(BOOL)a3
{
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;

  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_whichOneof_Primitivevalue = 1;
  self->_primitiveNull = a3;
}

- (BOOL)primitiveNull
{
  return self->_whichOneof_Primitivevalue == 1 && self->_primitiveNull;
}

- (void)deletePrimitiveNull
{
  if (self->_whichOneof_Primitivevalue == 1)
  {
    self->_whichOneof_Primitivevalue = 0;
    self->_primitiveNull = 0;
  }
}

- (void)setPrimitiveBool:(BOOL)a3
{
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;

  self->_primitiveNull = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_whichOneof_Primitivevalue = 2;
  self->_primitiveBool = a3;
}

- (BOOL)primitiveBool
{
  return self->_whichOneof_Primitivevalue == 2 && self->_primitiveBool;
}

- (void)deletePrimitiveBool
{
  if (self->_whichOneof_Primitivevalue == 2)
  {
    self->_whichOneof_Primitivevalue = 0;
    self->_primitiveBool = 0;
  }
}

- (void)setPrimitiveInt:(int64_t)a3
{
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;

  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_whichOneof_Primitivevalue = 3;
  self->_primitiveInt = a3;
}

- (int64_t)primitiveInt
{
  if (self->_whichOneof_Primitivevalue == 3)
    return self->_primitiveInt;
  else
    return 0;
}

- (void)deletePrimitiveInt
{
  if (self->_whichOneof_Primitivevalue == 3)
  {
    self->_whichOneof_Primitivevalue = 0;
    self->_primitiveInt = 0;
  }
}

- (void)setPrimitiveDouble:(double)a3
{
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;

  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_whichOneof_Primitivevalue = 4;
  self->_primitiveDouble = a3;
}

- (double)primitiveDouble
{
  double result;

  result = 0.0;
  if (self->_whichOneof_Primitivevalue == 4)
    return self->_primitiveDouble;
  return result;
}

- (void)deletePrimitiveDouble
{
  if (self->_whichOneof_Primitivevalue == 4)
  {
    self->_whichOneof_Primitivevalue = 0;
    self->_primitiveDouble = 0.0;
  }
}

- (void)setPrimitiveDecimal:(id)a3
{
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;
  unint64_t v12;
  NSString *v13;
  NSString *primitiveDecimal;
  id v15;

  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;
  v15 = a3;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  v12 = 5;
  if (!v15)
    v12 = 0;
  self->_whichOneof_Primitivevalue = v12;
  v13 = (NSString *)objc_msgSend(v15, "copy");
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = v13;

}

- (NSString)primitiveDecimal
{
  if (self->_whichOneof_Primitivevalue == 5)
    return self->_primitiveDecimal;
  else
    return (NSString *)0;
}

- (void)deletePrimitiveDecimal
{
  NSString *primitiveDecimal;

  if (self->_whichOneof_Primitivevalue == 5)
  {
    self->_whichOneof_Primitivevalue = 0;
    primitiveDecimal = self->_primitiveDecimal;
    self->_primitiveDecimal = 0;

  }
}

- (void)setPrimitiveDateComponents:(id)a3
{
  IFTSchemaIFTDateComponents *v4;
  NSString *primitiveDecimal;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;
  IFTSchemaIFTDateComponents *primitiveDateComponents;

  v4 = (IFTSchemaIFTDateComponents *)a3;
  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_whichOneof_Primitivevalue = 8 * (v4 != 0);
  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = v4;

}

- (IFTSchemaIFTDateComponents)primitiveDateComponents
{
  if (self->_whichOneof_Primitivevalue == 8)
    return self->_primitiveDateComponents;
  else
    return (IFTSchemaIFTDateComponents *)0;
}

- (void)deletePrimitiveDateComponents
{
  IFTSchemaIFTDateComponents *primitiveDateComponents;

  if (self->_whichOneof_Primitivevalue == 8)
  {
    self->_whichOneof_Primitivevalue = 0;
    primitiveDateComponents = self->_primitiveDateComponents;
    self->_primitiveDateComponents = 0;

  }
}

- (void)setMeasurement:(id)a3
{
  IFTSchemaIFTMeasurement *v4;
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;
  unint64_t v13;
  IFTSchemaIFTMeasurement *measurement;

  v4 = (IFTSchemaIFTMeasurement *)a3;
  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  v13 = 11;
  if (!v4)
    v13 = 0;
  self->_whichOneof_Primitivevalue = v13;
  measurement = self->_measurement;
  self->_measurement = v4;

}

- (IFTSchemaIFTMeasurement)measurement
{
  if (self->_whichOneof_Primitivevalue == 11)
    return self->_measurement;
  else
    return (IFTSchemaIFTMeasurement *)0;
}

- (void)deleteMeasurement
{
  IFTSchemaIFTMeasurement *measurement;

  if (self->_whichOneof_Primitivevalue == 11)
  {
    self->_whichOneof_Primitivevalue = 0;
    measurement = self->_measurement;
    self->_measurement = 0;

  }
}

- (void)setCurrencyAmount:(id)a3
{
  IFTSchemaIFTCurrencyAmount *v4;
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;
  unint64_t v13;
  IFTSchemaIFTCurrencyAmount *currencyAmount;

  v4 = (IFTSchemaIFTCurrencyAmount *)a3;
  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  v13 = 12;
  if (!v4)
    v13 = 0;
  self->_whichOneof_Primitivevalue = v13;
  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = v4;

}

- (IFTSchemaIFTCurrencyAmount)currencyAmount
{
  if (self->_whichOneof_Primitivevalue == 12)
    return self->_currencyAmount;
  else
    return (IFTSchemaIFTCurrencyAmount *)0;
}

- (void)deleteCurrencyAmount
{
  IFTSchemaIFTCurrencyAmount *currencyAmount;

  if (self->_whichOneof_Primitivevalue == 12)
  {
    self->_whichOneof_Primitivevalue = 0;
    currencyAmount = self->_currencyAmount;
    self->_currencyAmount = 0;

  }
}

- (void)setPaymentMethod:(id)a3
{
  IFTSchemaIFTPaymentMethod *v4;
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;
  unint64_t v13;
  IFTSchemaIFTPaymentMethod *paymentMethod;

  v4 = (IFTSchemaIFTPaymentMethod *)a3;
  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  v13 = 13;
  if (!v4)
    v13 = 0;
  self->_whichOneof_Primitivevalue = v13;
  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = v4;

}

- (IFTSchemaIFTPaymentMethod)paymentMethod
{
  if (self->_whichOneof_Primitivevalue == 13)
    return self->_paymentMethod;
  else
    return (IFTSchemaIFTPaymentMethod *)0;
}

- (void)deletePaymentMethod
{
  IFTSchemaIFTPaymentMethod *paymentMethod;

  if (self->_whichOneof_Primitivevalue == 13)
  {
    self->_whichOneof_Primitivevalue = 0;
    paymentMethod = self->_paymentMethod;
    self->_paymentMethod = 0;

  }
}

- (void)setPlacemark:(id)a3
{
  IFTSchemaIFTPlacemark *v4;
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;
  unint64_t v13;
  IFTSchemaIFTPlacemark *placemark;

  v4 = (IFTSchemaIFTPlacemark *)a3;
  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  v13 = 14;
  if (!v4)
    v13 = 0;
  self->_whichOneof_Primitivevalue = v13;
  placemark = self->_placemark;
  self->_placemark = v4;

}

- (IFTSchemaIFTPlacemark)placemark
{
  if (self->_whichOneof_Primitivevalue == 14)
    return self->_placemark;
  else
    return (IFTSchemaIFTPlacemark *)0;
}

- (void)deletePlacemark
{
  IFTSchemaIFTPlacemark *placemark;

  if (self->_whichOneof_Primitivevalue == 14)
  {
    self->_whichOneof_Primitivevalue = 0;
    placemark = self->_placemark;
    self->_placemark = 0;

  }
}

- (void)setPerson:(id)a3
{
  IFTSchemaIFTPerson *v4;
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTFile *file;
  IFTSchemaIFTApp *app;
  unint64_t v13;
  IFTSchemaIFTPerson *person;

  v4 = (IFTSchemaIFTPerson *)a3;
  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  v13 = 15;
  if (!v4)
    v13 = 0;
  self->_whichOneof_Primitivevalue = v13;
  person = self->_person;
  self->_person = v4;

}

- (IFTSchemaIFTPerson)person
{
  if (self->_whichOneof_Primitivevalue == 15)
    return self->_person;
  else
    return (IFTSchemaIFTPerson *)0;
}

- (void)deletePerson
{
  IFTSchemaIFTPerson *person;

  if (self->_whichOneof_Primitivevalue == 15)
  {
    self->_whichOneof_Primitivevalue = 0;
    person = self->_person;
    self->_person = 0;

  }
}

- (void)setFile:(id)a3
{
  IFTSchemaIFTFile *v4;
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTApp *app;
  IFTSchemaIFTFile *file;

  v4 = (IFTSchemaIFTFile *)a3;
  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  app = self->_app;
  self->_app = 0;

  self->_whichOneof_Primitivevalue = 16 * (v4 != 0);
  file = self->_file;
  self->_file = v4;

}

- (IFTSchemaIFTFile)file
{
  if (self->_whichOneof_Primitivevalue == 16)
    return self->_file;
  else
    return (IFTSchemaIFTFile *)0;
}

- (void)deleteFile
{
  IFTSchemaIFTFile *file;

  if (self->_whichOneof_Primitivevalue == 16)
  {
    self->_whichOneof_Primitivevalue = 0;
    file = self->_file;
    self->_file = 0;

  }
}

- (void)setApp:(id)a3
{
  IFTSchemaIFTApp *v4;
  NSString *primitiveDecimal;
  IFTSchemaIFTDateComponents *primitiveDateComponents;
  IFTSchemaIFTMeasurement *measurement;
  IFTSchemaIFTCurrencyAmount *currencyAmount;
  IFTSchemaIFTPaymentMethod *paymentMethod;
  IFTSchemaIFTPlacemark *placemark;
  IFTSchemaIFTPerson *person;
  IFTSchemaIFTFile *file;
  unint64_t v13;
  IFTSchemaIFTApp *app;

  v4 = (IFTSchemaIFTApp *)a3;
  self->_primitiveNull = 0;
  self->_primitiveBool = 0;
  self->_primitiveInt = 0;
  self->_primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  v13 = 17;
  if (!v4)
    v13 = 0;
  self->_whichOneof_Primitivevalue = v13;
  app = self->_app;
  self->_app = v4;

}

- (IFTSchemaIFTApp)app
{
  if (self->_whichOneof_Primitivevalue == 17)
    return self->_app;
  else
    return (IFTSchemaIFTApp *)0;
}

- (void)deleteApp
{
  IFTSchemaIFTApp *app;

  if (self->_whichOneof_Primitivevalue == 17)
  {
    self->_whichOneof_Primitivevalue = 0;
    app = self->_app;
    self->_app = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTPrimitiveValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t whichOneof_Primitivevalue;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  if (whichOneof_Primitivevalue == 1)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 2)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 3)
  {
    PBDataWriterWriteInt64Field();
    whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 4)
    PBDataWriterWriteDoubleField();
  -[IFTSchemaIFTPrimitiveValue primitiveDecimal](self, "primitiveDecimal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[IFTSchemaIFTPrimitiveValue primitiveDateComponents](self, "primitiveDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTPrimitiveValue primitiveDateComponents](self, "primitiveDateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTPrimitiveValue measurement](self, "measurement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFTSchemaIFTPrimitiveValue measurement](self, "measurement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTPrimitiveValue currencyAmount](self, "currencyAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IFTSchemaIFTPrimitiveValue currencyAmount](self, "currencyAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTPrimitiveValue paymentMethod](self, "paymentMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[IFTSchemaIFTPrimitiveValue paymentMethod](self, "paymentMethod");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTPrimitiveValue placemark](self, "placemark");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IFTSchemaIFTPrimitiveValue placemark](self, "placemark");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTPrimitiveValue person](self, "person");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[IFTSchemaIFTPrimitiveValue person](self, "person");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTPrimitiveValue file](self, "file");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IFTSchemaIFTPrimitiveValue file](self, "file");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTPrimitiveValue app](self, "app");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v23;
  if (v20)
  {
    -[IFTSchemaIFTPrimitiveValue app](self, "app");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v21 = v23;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Primitivevalue;
  int primitiveNull;
  int primitiveBool;
  int64_t primitiveInt;
  double primitiveDouble;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  BOOL v58;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  if (whichOneof_Primitivevalue != objc_msgSend(v4, "whichOneof_Primitivevalue"))
    goto LABEL_52;
  primitiveNull = self->_primitiveNull;
  if (primitiveNull != objc_msgSend(v4, "primitiveNull"))
    goto LABEL_52;
  primitiveBool = self->_primitiveBool;
  if (primitiveBool != objc_msgSend(v4, "primitiveBool"))
    goto LABEL_52;
  primitiveInt = self->_primitiveInt;
  if (primitiveInt != objc_msgSend(v4, "primitiveInt"))
    goto LABEL_52;
  primitiveDouble = self->_primitiveDouble;
  objc_msgSend(v4, "primitiveDouble");
  if (primitiveDouble != v10)
    goto LABEL_52;
  -[IFTSchemaIFTPrimitiveValue primitiveDecimal](self, "primitiveDecimal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primitiveDecimal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_51;
  -[IFTSchemaIFTPrimitiveValue primitiveDecimal](self, "primitiveDecimal");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTPrimitiveValue primitiveDecimal](self, "primitiveDecimal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primitiveDecimal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_52;
  }
  else
  {

  }
  -[IFTSchemaIFTPrimitiveValue primitiveDateComponents](self, "primitiveDateComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primitiveDateComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_51;
  -[IFTSchemaIFTPrimitiveValue primitiveDateComponents](self, "primitiveDateComponents");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[IFTSchemaIFTPrimitiveValue primitiveDateComponents](self, "primitiveDateComponents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primitiveDateComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_52;
  }
  else
  {

  }
  -[IFTSchemaIFTPrimitiveValue measurement](self, "measurement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "measurement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_51;
  -[IFTSchemaIFTPrimitiveValue measurement](self, "measurement");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[IFTSchemaIFTPrimitiveValue measurement](self, "measurement");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "measurement");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_52;
  }
  else
  {

  }
  -[IFTSchemaIFTPrimitiveValue currencyAmount](self, "currencyAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyAmount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_51;
  -[IFTSchemaIFTPrimitiveValue currencyAmount](self, "currencyAmount");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[IFTSchemaIFTPrimitiveValue currencyAmount](self, "currencyAmount");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currencyAmount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_52;
  }
  else
  {

  }
  -[IFTSchemaIFTPrimitiveValue paymentMethod](self, "paymentMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_51;
  -[IFTSchemaIFTPrimitiveValue paymentMethod](self, "paymentMethod");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[IFTSchemaIFTPrimitiveValue paymentMethod](self, "paymentMethod");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentMethod");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_52;
  }
  else
  {

  }
  -[IFTSchemaIFTPrimitiveValue placemark](self, "placemark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placemark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_51;
  -[IFTSchemaIFTPrimitiveValue placemark](self, "placemark");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[IFTSchemaIFTPrimitiveValue placemark](self, "placemark");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placemark");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_52;
  }
  else
  {

  }
  -[IFTSchemaIFTPrimitiveValue person](self, "person");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_51;
  -[IFTSchemaIFTPrimitiveValue person](self, "person");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[IFTSchemaIFTPrimitiveValue person](self, "person");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "person");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_52;
  }
  else
  {

  }
  -[IFTSchemaIFTPrimitiveValue file](self, "file");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "file");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_51;
  -[IFTSchemaIFTPrimitiveValue file](self, "file");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[IFTSchemaIFTPrimitiveValue file](self, "file");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "file");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_52;
  }
  else
  {

  }
  -[IFTSchemaIFTPrimitiveValue app](self, "app");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "app");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) != (v12 != 0))
  {
    -[IFTSchemaIFTPrimitiveValue app](self, "app");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {

LABEL_55:
      v58 = 1;
      goto LABEL_53;
    }
    v54 = (void *)v53;
    -[IFTSchemaIFTPrimitiveValue app](self, "app");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "app");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if ((v57 & 1) != 0)
      goto LABEL_55;
  }
  else
  {
LABEL_51:

  }
LABEL_52:
  v58 = 0;
LABEL_53:

  return v58;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double primitiveDouble;
  double v6;
  long double v7;
  double v8;
  NSUInteger v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  switch(self->_whichOneof_Primitivevalue)
  {
    case 1uLL:
      v3 = 8;
      goto LABEL_10;
    case 2uLL:
      v3 = 9;
LABEL_10:
      v4 = 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + v3);
      break;
    case 3uLL:
      v4 = 2654435761 * self->_primitiveInt;
      break;
    case 4uLL:
      primitiveDouble = self->_primitiveDouble;
      v6 = -primitiveDouble;
      if (primitiveDouble >= 0.0)
        v6 = self->_primitiveDouble;
      v7 = floor(v6 + 0.5);
      v8 = (v6 - v7) * 1.84467441e19;
      v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
      if (v8 >= 0.0)
      {
        if (v8 > 0.0)
          v4 += (unint64_t)v8;
      }
      else
      {
        v4 -= (unint64_t)fabs(v8);
      }
      break;
    default:
      v4 = 0;
      break;
  }
  v9 = -[NSString hash](self->_primitiveDecimal, "hash") ^ v4;
  v10 = -[IFTSchemaIFTDateComponents hash](self->_primitiveDateComponents, "hash");
  v11 = v9 ^ v10 ^ -[IFTSchemaIFTMeasurement hash](self->_measurement, "hash");
  v12 = -[IFTSchemaIFTCurrencyAmount hash](self->_currencyAmount, "hash");
  v13 = v12 ^ -[IFTSchemaIFTPaymentMethod hash](self->_paymentMethod, "hash");
  v14 = v11 ^ v13 ^ -[IFTSchemaIFTPlacemark hash](self->_placemark, "hash");
  v15 = -[IFTSchemaIFTPerson hash](self->_person, "hash");
  v16 = v15 ^ -[IFTSchemaIFTFile hash](self->_file, "hash");
  return v14 ^ v16 ^ -[IFTSchemaIFTApp hash](self->_app, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t whichOneof_Primitivevalue;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_app)
  {
    -[IFTSchemaIFTPrimitiveValue app](self, "app");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("app"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("app"));

    }
  }
  if (self->_currencyAmount)
  {
    -[IFTSchemaIFTPrimitiveValue currencyAmount](self, "currencyAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("currencyAmount"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("currencyAmount"));

    }
  }
  if (self->_file)
  {
    -[IFTSchemaIFTPrimitiveValue file](self, "file");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("file"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("file"));

    }
  }
  if (self->_measurement)
  {
    -[IFTSchemaIFTPrimitiveValue measurement](self, "measurement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("measurement"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("measurement"));

    }
  }
  if (self->_paymentMethod)
  {
    -[IFTSchemaIFTPrimitiveValue paymentMethod](self, "paymentMethod");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("paymentMethod"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("paymentMethod"));

    }
  }
  if (self->_person)
  {
    -[IFTSchemaIFTPrimitiveValue person](self, "person");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("person"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("person"));

    }
  }
  if (self->_placemark)
  {
    -[IFTSchemaIFTPrimitiveValue placemark](self, "placemark");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("placemark"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("placemark"));

    }
  }
  if (self->_whichOneof_Primitivevalue == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPrimitiveValue primitiveBool](self, "primitiveBool"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("primitiveBool"));

  }
  if (self->_primitiveDateComponents)
  {
    -[IFTSchemaIFTPrimitiveValue primitiveDateComponents](self, "primitiveDateComponents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("primitiveDateComponents"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("primitiveDateComponents"));

    }
  }
  if (self->_primitiveDecimal)
  {
    -[IFTSchemaIFTPrimitiveValue primitiveDecimal](self, "primitiveDecimal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("primitiveDecimal"));

  }
  whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  if (whichOneof_Primitivevalue == 4)
  {
    v32 = (void *)MEMORY[0x1E0CB37E8];
    -[IFTSchemaIFTPrimitiveValue primitiveDouble](self, "primitiveDouble");
    objc_msgSend(v32, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("primitiveDouble"));

    whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IFTSchemaIFTPrimitiveValue primitiveInt](self, "primitiveInt"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("primitiveInt"));

    whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPrimitiveValue primitiveNull](self, "primitiveNull"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("primitiveNull"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTPrimitiveValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (IFTSchemaIFTPrimitiveValue)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTPrimitiveValue *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[IFTSchemaIFTPrimitiveValue initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTPrimitiveValue)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTPrimitiveValue *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  IFTSchemaIFTDateComponents *v13;
  uint64_t v14;
  IFTSchemaIFTMeasurement *v15;
  void *v16;
  IFTSchemaIFTCurrencyAmount *v17;
  void *v18;
  IFTSchemaIFTPaymentMethod *v19;
  void *v20;
  IFTSchemaIFTPlacemark *v21;
  void *v22;
  void *v23;
  IFTSchemaIFTPerson *v24;
  void *v25;
  IFTSchemaIFTFile *v26;
  void *v27;
  IFTSchemaIFTApp *v28;
  IFTSchemaIFTPrimitiveValue *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)IFTSchemaIFTPrimitiveValue;
  v5 = -[IFTSchemaIFTPrimitiveValue init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primitiveNull"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPrimitiveValue setPrimitiveNull:](v5, "setPrimitiveNull:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primitiveBool"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPrimitiveValue setPrimitiveBool:](v5, "setPrimitiveBool:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primitiveInt"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPrimitiveValue setPrimitiveInt:](v5, "setPrimitiveInt:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primitiveDouble"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[IFTSchemaIFTPrimitiveValue setPrimitiveDouble:](v5, "setPrimitiveDouble:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primitiveDecimal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[IFTSchemaIFTPrimitiveValue setPrimitiveDecimal:](v5, "setPrimitiveDecimal:", v11);

    }
    v33 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primitiveDateComponents"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[IFTSchemaIFTDateComponents initWithDictionary:]([IFTSchemaIFTDateComponents alloc], "initWithDictionary:", v12);
      -[IFTSchemaIFTPrimitiveValue setPrimitiveDateComponents:](v5, "setPrimitiveDateComponents:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("measurement"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[IFTSchemaIFTMeasurement initWithDictionary:]([IFTSchemaIFTMeasurement alloc], "initWithDictionary:", v14);
      -[IFTSchemaIFTPrimitiveValue setMeasurement:](v5, "setMeasurement:", v15);

    }
    v36 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currencyAmount"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[IFTSchemaIFTCurrencyAmount initWithDictionary:]([IFTSchemaIFTCurrencyAmount alloc], "initWithDictionary:", v16);
      -[IFTSchemaIFTPrimitiveValue setCurrencyAmount:](v5, "setCurrencyAmount:", v17);

    }
    v35 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("paymentMethod"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[IFTSchemaIFTPaymentMethod initWithDictionary:]([IFTSchemaIFTPaymentMethod alloc], "initWithDictionary:", v18);
      -[IFTSchemaIFTPrimitiveValue setPaymentMethod:](v5, "setPaymentMethod:", v19);

    }
    v32 = (void *)v12;
    v34 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placemark"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[IFTSchemaIFTPlacemark initWithDictionary:]([IFTSchemaIFTPlacemark alloc], "initWithDictionary:", v20);
      -[IFTSchemaIFTPrimitiveValue setPlacemark:](v5, "setPlacemark:", v21);

    }
    v22 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("person"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[IFTSchemaIFTPerson initWithDictionary:]([IFTSchemaIFTPerson alloc], "initWithDictionary:", v23);
      -[IFTSchemaIFTPrimitiveValue setPerson:](v5, "setPerson:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[IFTSchemaIFTFile initWithDictionary:]([IFTSchemaIFTFile alloc], "initWithDictionary:", v25);
      -[IFTSchemaIFTPrimitiveValue setFile:](v5, "setFile:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("app"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[IFTSchemaIFTApp initWithDictionary:]([IFTSchemaIFTApp alloc], "initWithDictionary:", v27);
      -[IFTSchemaIFTPrimitiveValue setApp:](v5, "setApp:", v28);

    }
    v29 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Primitivevalue
{
  return self->_whichOneof_Primitivevalue;
}

- (BOOL)hasPrimitiveNull
{
  return self->_hasPrimitiveNull;
}

- (void)setHasPrimitiveNull:(BOOL)a3
{
  self->_hasPrimitiveNull = a3;
}

- (BOOL)hasPrimitiveBool
{
  return self->_hasPrimitiveBool;
}

- (void)setHasPrimitiveBool:(BOOL)a3
{
  self->_hasPrimitiveBool = a3;
}

- (BOOL)hasPrimitiveInt
{
  return self->_hasPrimitiveInt;
}

- (void)setHasPrimitiveInt:(BOOL)a3
{
  self->_hasPrimitiveInt = a3;
}

- (BOOL)hasPrimitiveDouble
{
  return self->_hasPrimitiveDouble;
}

- (void)setHasPrimitiveDouble:(BOOL)a3
{
  self->_hasPrimitiveDouble = a3;
}

- (BOOL)hasPrimitiveDecimal
{
  return self->_hasPrimitiveDecimal;
}

- (void)setHasPrimitiveDecimal:(BOOL)a3
{
  self->_hasPrimitiveDecimal = a3;
}

- (BOOL)hasPrimitiveDateComponents
{
  return self->_hasPrimitiveDateComponents;
}

- (void)setHasPrimitiveDateComponents:(BOOL)a3
{
  self->_hasPrimitiveDateComponents = a3;
}

- (BOOL)hasMeasurement
{
  return self->_hasMeasurement;
}

- (void)setHasMeasurement:(BOOL)a3
{
  self->_hasMeasurement = a3;
}

- (BOOL)hasCurrencyAmount
{
  return self->_hasCurrencyAmount;
}

- (void)setHasCurrencyAmount:(BOOL)a3
{
  self->_hasCurrencyAmount = a3;
}

- (BOOL)hasPaymentMethod
{
  return self->_hasPaymentMethod;
}

- (void)setHasPaymentMethod:(BOOL)a3
{
  self->_hasPaymentMethod = a3;
}

- (BOOL)hasPlacemark
{
  return self->_hasPlacemark;
}

- (void)setHasPlacemark:(BOOL)a3
{
  self->_hasPlacemark = a3;
}

- (BOOL)hasPerson
{
  return self->_hasPerson;
}

- (void)setHasPerson:(BOOL)a3
{
  self->_hasPerson = a3;
}

- (BOOL)hasFile
{
  return self->_hasFile;
}

- (void)setHasFile:(BOOL)a3
{
  self->_hasFile = a3;
}

- (BOOL)hasApp
{
  return self->_hasApp;
}

- (void)setHasApp:(BOOL)a3
{
  self->_hasApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_primitiveDateComponents, 0);
  objc_storeStrong((id *)&self->_primitiveDecimal, 0);
}

@end
