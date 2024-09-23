@implementation CLSFaceInformation

- (id)initForKnownPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8
{
  return -[CLSFaceInformation _initWithFaceSize:faceQuality:isKnownPerson:isHiddenPerson:faceSizeIsGood:faceIsGood:faceIsOk:traits:](self, "_initWithFaceSize:faceQuality:isKnownPerson:isHiddenPerson:faceSizeIsGood:faceIsGood:faceIsOk:traits:", 1, 0, a5, a6, a7, a8, a3, a4);
}

- (id)initForHiddenPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8
{
  return -[CLSFaceInformation _initWithFaceSize:faceQuality:isKnownPerson:isHiddenPerson:faceSizeIsGood:faceIsGood:faceIsOk:traits:](self, "_initWithFaceSize:faceQuality:isKnownPerson:isHiddenPerson:faceSizeIsGood:faceIsGood:faceIsOk:traits:", 0, 1, a5, a6, a7, a8, a3, a4);
}

- (id)initForUnknownPersonWithFaceSize:(double)a3 faceQuality:(double)a4 faceSizeIsGood:(BOOL)a5 faceIsGood:(BOOL)a6 faceIsOk:(BOOL)a7 traits:(id)a8
{
  return -[CLSFaceInformation _initWithFaceSize:faceQuality:isKnownPerson:isHiddenPerson:faceSizeIsGood:faceIsGood:faceIsOk:traits:](self, "_initWithFaceSize:faceQuality:isKnownPerson:isHiddenPerson:faceSizeIsGood:faceIsGood:faceIsOk:traits:", 0, 0, a5, a6, a7, a8, a3, a4);
}

- (CLSFaceInformation)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  CLSFaceInformation *v24;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceQuality"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isKnownPerson"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHiddenPerson"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceSizeIsGood"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceIsGood"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceIsOk"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  v21 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traits"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "_traitsFromTraitsPropertyListRepresentation:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[CLSFaceInformation _initWithFaceSize:faceQuality:isKnownPerson:isHiddenPerson:faceSizeIsGood:faceIsGood:faceIsOk:traits:](self, "_initWithFaceSize:faceQuality:isKnownPerson:isHiddenPerson:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v12, v14, v16, v18, v20, v23, v7, v10);
  return v24;
}

- (id)_initWithFaceSize:(double)a3 faceQuality:(double)a4 isKnownPerson:(BOOL)a5 isHiddenPerson:(BOOL)a6 faceSizeIsGood:(BOOL)a7 faceIsGood:(BOOL)a8 faceIsOk:(BOOL)a9 traits:(id)a10
{
  _BOOL4 v11;
  _BOOL4 v12;
  id v19;
  CLSFaceInformation *v20;
  CLSFaceInformation *v21;
  char v22;
  char v23;
  objc_super v25;

  v11 = a9;
  v12 = a8;
  v19 = a10;
  v25.receiver = self;
  v25.super_class = (Class)CLSFaceInformation;
  v20 = -[CLSFaceInformation init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_faceSize = a3;
    v20->_faceQuality = a4;
    v20->_isKnownPerson = a5;
    v20->_isHiddenPerson = a6;
    if (v12)
      v22 = 2;
    else
      v22 = 0;
    if (v11)
      v23 = 4;
    else
      v23 = 0;
    *((_BYTE *)v20 + 8) = v22 | a7 | v23 | *((_BYTE *)v20 + 8) & 0xF8;
    objc_storeStrong((id *)&v20->_traits, a10);
  }

  return v21;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[CLSFaceInformation] size %.3f, quality %.3f"), *(_QWORD *)&self->_faceSize, *(_QWORD *)&self->_faceQuality);
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
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("faceSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_faceSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("faceQuality");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_faceQuality);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("isKnownPerson");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isKnownPerson);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("isHiddenPerson");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isHiddenPerson);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("faceSizeIsGood");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((_BYTE *)self + 8) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  v13[5] = CFSTR("faceIsGood");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*((unsigned __int8 *)self + 8) >> 1) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  v13[6] = CFSTR("faceIsOk");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*((unsigned __int8 *)self + 8) >> 2) & 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  v13[7] = CFSTR("traits");
  -[CLSFaceInformation _propertyListRepresentationOfTraits](self, "_propertyListRepresentationOfTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_propertyListRepresentationOfTraits
{
  void *v3;
  NSArray *traits;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_traits, "count"));
  traits = self->_traits;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__CLSFaceInformation__propertyListRepresentationOfTraits__block_invoke;
  v7[3] = &unk_251480588;
  v5 = v3;
  v8 = v5;
  -[NSArray enumerateObjectsUsingBlock:](traits, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (double)faceSize
{
  return self->_faceSize;
}

- (double)faceQuality
{
  return self->_faceQuality;
}

- (BOOL)isKnownPerson
{
  return self->_isKnownPerson;
}

- (BOOL)isHiddenPerson
{
  return self->_isHiddenPerson;
}

- (BOOL)faceSizeIsGood
{
  return *((_BYTE *)self + 8) & 1;
}

- (BOOL)faceIsGood
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (BOOL)faceIsOk
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (NSArray)traits
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
}

void __57__CLSFaceInformation__propertyListRepresentationOfTraits__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "propertyListRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (id)_traitsFromTraitsPropertyListRepresentation:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__CLSFaceInformation__traitsFromTraitsPropertyListRepresentation___block_invoke;
  v8[3] = &unk_251480560;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __66__CLSFaceInformation__traitsFromTraitsPropertyListRepresentation___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BDE3540];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithPropertyListRepresentation:", v4);

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

@end
