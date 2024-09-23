@implementation BKPDFLocation

+ (id)locationForSelection:(id)a3 offset:(unint64_t)a4
{
  id v5;
  BKPDFLocation *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = -[BKPageLocation initWithOrdinal:andOffset:]([BKPDFLocation alloc], "initWithOrdinal:andOffset:", 0, a4);
  -[BKPDFLocation setSelection:](v6, "setSelection:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "html"));

  v8 = sub_93118(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[BKPDFLocation setSerialData:](v6, "setSerialData:", v9);

  return v6;
}

- (BKPDFLocation)initWithLocationDictionary:(id)a3
{
  id v4;
  void *v5;
  BKPDFLocation *v6;
  uint64_t v7;
  NSData *serialData;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("super")));
  v10.receiver = self;
  v10.super_class = (Class)BKPDFLocation;
  v6 = -[BKPageLocation initWithLocationDictionary:](&v10, "initWithLocationDictionary:", v5);
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("serialData")));
    serialData = v6->_serialData;
    v6->_serialData = (NSData *)v7;

  }
  return v6;
}

- (id)serializeLocationToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSData *serialData;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKPDFLocation;
  v3 = -[BKPageLocation serializeLocationToDictionary](&v13, "serializeLocationToDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFLocation selection](self, "selection"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFLocation selection](self, "selection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "html"));

    v8 = sub_93118(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[BKPDFLocation setSerialData:](self, "setSerialData:", v9);

  }
  if (v4 && (serialData = self->_serialData) != 0)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("super"), serialData, CFSTR("serialData"), CFSTR("BKPDFLocation"), CFSTR("class"), 0));
  else
    v11 = 0;

  return v11;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BKPDFLocation *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKPDFLocation")))
    v5 = -[BKPDFLocation initWithLocationDictionary:]([BKPDFLocation alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

- (id)stringValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKPDFLocation;
  v3 = -[BKPageLocation stringValue](&v8, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFLocation serialString](self, "serialString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ %@, serialString: %@ }"), v4, v5));

  return v6;
}

- (id)serialString
{
  void *v3;
  id v4;
  size_t *v5;
  size_t v6;
  Bytef *v7;
  Bytef *v8;
  id v9;
  z_stream v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFLocation serialData](self, "serialData"));

  if (!v3)
    return 0;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKPDFLocation serialData](self, "serialData")));
  v5 = (size_t *)objc_msgSend(v4, "bytes");
  v7 = (Bytef *)(v5 + 1);
  v6 = *v5;
  v8 = (Bytef *)malloc_type_malloc(*v5, 0xA077D0C0uLL);
  *(_OWORD *)&v11.avail_in = 0u;
  memset(&v11.total_out, 0, 72);
  v11.next_in = v7;
  v11.avail_in = v6;
  v11.next_out = v8;
  *(_QWORD *)&v11.avail_out = v6;
  v9 = 0;
  if (!inflateInit_(&v11, "1.2.12", 112))
  {
    if (inflate(&v11, 4) == 1)
      v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v8, v6, 4);
    else
      v9 = 0;
    inflateEnd(&v11);
    free(v8);
  }

  return v9;
}

- (BKPDFLocation)initWithCoder:(id)a3
{
  id v4;
  BKPDFLocation *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  NSData *serialData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKPDFLocation;
  v5 = -[BKPageLocation initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    *(_QWORD *)&v6 = objc_opt_class(NSData).n128_u64[0];
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("serialData"), v6));
    serialData = v5->_serialData;
    v5->_serialData = (NSData *)v8;

    -[BKPDFLocation setSelection:](v5, "setSelection:", 0);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPDFLocation;
  v4 = a3;
  -[BKPageLocation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_serialData, CFSTR("serialData"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDFSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
  objc_storeStrong((id *)&self->_selection, a3);
}

- (NSData)serialData
{
  return self->_serialData;
}

- (void)setSerialData:(id)a3
{
  objc_storeStrong((id *)&self->_serialData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialData, 0);
  objc_storeStrong((id *)&self->_selection, 0);
}

@end
