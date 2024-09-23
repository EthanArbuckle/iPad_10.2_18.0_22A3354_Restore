@implementation MTPObjectProperty

- (MTPObjectProperty)initWithPropertyCode:(unsigned __int16)a3 andDataType:(unsigned __int16)a4
{
  MTPObjectProperty *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTPObjectProperty;
  result = -[MTPObjectProperty init](&v7, "init");
  if (result)
  {
    result->_propertyCode = a3;
    result->_dataType = a4;
    *(_WORD *)&result->_writableSet = 0;
    result->_groupCode = 0;
  }
  return result;
}

+ (id)objectPropertyWithPropertyCode:(unsigned int)a3 andDataType:(unsigned __int16)a4
{
  return -[MTPObjectProperty initWithPropertyCode:andDataType:]([MTPObjectProperty alloc], "initWithPropertyCode:andDataType:", (unsigned __int16)a3, a4);
}

- (void)objectValue:(id)a3 withObject:(id)a4 andHandle:(unsigned int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int16 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BYTE *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  switch(self->_propertyCode)
  {
    case 0xDC01u:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInfoDataset"));
      v12 = objc_msgSend(v11, "storageID");
      goto LABEL_13;
    case 0xDC02u:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInfoDataset"));
      v14 = (unsigned __int16)objc_msgSend(v13, "objectFormat");

      LOWORD(v39) = v14;
      v15 = v8;
      v16 = 2;
      goto LABEL_14;
    case 0xDC03u:
    case 0xDC05u:
    case 0xDC06u:
    case 0xDC0Au:
      goto LABEL_15;
    case 0xDC04u:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInfoDataset"));
      v18 = objc_msgSend(v17, "objectCompressedSize64");

      v39 = v18;
      goto LABEL_7;
    case 0xDC07u:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInfoDataset"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filename"));
      v21 = objc_msgSend(v20, "length");

      v22 = 2 * (_QWORD)v21 + 3;
      __chkstk_darwin();
      v24 = (char *)&v37 - v23;
      v39 = (char *)&v37 - v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectInfoDataset"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "filename"));
      goto LABEL_11;
    case 0xDC08u:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInfoDataset"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "captureDate"));
      v29 = objc_msgSend(v28, "length");

      v22 = 2 * (_QWORD)v29 + 3;
      __chkstk_darwin();
      v24 = (char *)&v37 - v30;
      v39 = (char *)&v37 - v30;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectInfoDataset"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "captureDate"));
      goto LABEL_11;
    case 0xDC09u:
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInfoDataset"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "modificationDate"));
      v33 = objc_msgSend(v32, "length");

      v22 = 2 * (_QWORD)v33 + 3;
      __chkstk_darwin();
      v24 = (char *)&v37 - v34;
      v39 = (char *)&v37 - v34;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectInfoDataset"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "modificationDate"));
LABEL_11:
      v35 = v26;
      sub_10002071C(&v39, v26);

      objc_msgSend(v8, "appendBytes:length:", v24, v22);
      goto LABEL_15;
    case 0xDC0Bu:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInfoDataset"));
      v12 = objc_msgSend(v11, "parentObject");
LABEL_13:
      v36 = v12;

      LODWORD(v39) = v36;
      v15 = v8;
      v16 = 4;
      goto LABEL_14;
    default:
      if (self->_propertyCode != 56385)
        goto LABEL_15;
      v38 = a5;
      v39 = (_BYTE *)a5;
      objc_msgSend(v8, "appendBytes:length:", &v38, 8);
LABEL_7:
      v15 = v8;
      v16 = 8;
LABEL_14:
      objc_msgSend(v15, "appendBytes:length:", &v39, v16);
LABEL_15:

      return;
  }
}

- (void)objectPropertyDescriptionDataset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 dataType;
  unsigned __int16 propertyCode;

  v4 = a3;
  propertyCode = self->_propertyCode;
  objc_msgSend(v4, "appendBytes:length:", &propertyCode, 2);
  dataType = self->_dataType;
  objc_msgSend(v4, "appendBytes:length:", &dataType, 2);
  objc_msgSend(v4, "appendBytes:length:", &self->_writableSet, 1);
  switch(self->_dataType)
  {
    case 4u:
      LOWORD(v7) = 0;
      v5 = v4;
      v6 = 2;
      goto LABEL_9;
    case 5u:
    case 7u:
    case 9u:
      goto LABEL_10;
    case 6u:
      LODWORD(v7) = 0;
      v5 = v4;
      v6 = 4;
      goto LABEL_9;
    case 8u:
      v7 = 0;
      v5 = v4;
      v6 = 8;
      goto LABEL_9;
    case 0xAu:
      v7 = 0;
      objc_msgSend(v4, "appendBytes:length:", &v7, 8);
      objc_msgSend(v4, "appendBytes:length:", &v7, 8);
      goto LABEL_8;
    default:
      if (self->_dataType != 0xFFFF)
        goto LABEL_10;
LABEL_8:
      LOBYTE(v7) = 0;
      v5 = v4;
      v6 = 1;
LABEL_9:
      objc_msgSend(v5, "appendBytes:length:", &v7, v6, v7);
LABEL_10:
      LODWORD(v7) = 0;
      objc_msgSend(v4, "appendBytes:length:", &v7, 4);
      objc_msgSend(v4, "appendBytes:length:", &self->_formFlag, 1);

      return;
  }
}

- (void)objectPropertyListElement:(id)a3 withObject:(id)a4 andHandle:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  unsigned __int16 dataType;
  unsigned __int16 propertyCode;
  unsigned int v12;

  v5 = *(_QWORD *)&a5;
  v12 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "appendBytes:length:", &v12, 4);
  propertyCode = self->_propertyCode;
  objc_msgSend(v9, "appendBytes:length:", &propertyCode, 2);
  dataType = self->_dataType;
  objc_msgSend(v9, "appendBytes:length:", &dataType, 2);
  -[MTPObjectProperty objectValue:withObject:andHandle:](self, "objectValue:withObject:andHandle:", v9, v8, v5);

}

- (void)dealloc
{
  char *dataValue;
  objc_super v4;

  dataValue = self->_dataValue;
  if (dataValue)
    free(dataValue);
  v4.receiver = self;
  v4.super_class = (Class)MTPObjectProperty;
  -[MTPObjectProperty dealloc](&v4, "dealloc");
}

- (unsigned)propertyCode
{
  return self->_propertyCode;
}

- (void)setPropertyCode:(unsigned __int16)a3
{
  self->_propertyCode = a3;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unsigned __int16)a3
{
  self->_dataType = a3;
}

- (unsigned)writableSet
{
  return self->_writableSet;
}

- (void)setWritableSet:(unsigned __int8)a3
{
  self->_writableSet = a3;
}

- (char)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(char *)a3
{
  self->_dataValue = a3;
}

- (unsigned)groupCode
{
  return self->_groupCode;
}

- (void)setGroupCode:(unsigned int)a3
{
  self->_groupCode = a3;
}

- (unsigned)formFlag
{
  return self->_formFlag;
}

- (void)setFormFlag:(unsigned __int8)a3
{
  self->_formFlag = a3;
}

- (BOOL)useString
{
  return self->_useString;
}

- (void)setUseString:(BOOL)a3
{
  self->_useString = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableData)dataObject
{
  return self->_dataObject;
}

- (void)setDataObject:(id)a3
{
  objc_storeStrong((id *)&self->_dataObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataObject, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
