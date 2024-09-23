@implementation NSDataAsset

- (NSData)data
{
  NSData *result;

  result = (NSData *)-[CUINamedData data](self->_namedData, "data");
  if (!result)
    return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  return result;
}

- (NSString)typeIdentifier
{
  NSString *result;

  result = (NSString *)-[CUINamedData utiType](self->_namedData, "utiType");
  if (!result)
    return (NSString *)objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  return result;
}

- (NSDataAsset)initWithName:(NSDataAssetName)name bundle:(NSBundle *)bundle
{
  NSDataAsset *v7;
  void *v8;
  CUINamedData *v9;
  objc_super v11;

  if (!name)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDataAsset.m"), 41, CFSTR("You cannot create an instance of %@ with a nil name."), objc_opt_class());
  v11.receiver = self;
  v11.super_class = (Class)NSDataAsset;
  v7 = -[NSDataAsset init](&v11, sel_init);
  if (v7)
  {
    if (!bundle)
      bundle = (NSBundle *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    if (_NSTextScalingTypeForCurrentEnvironment() == 1)
      v8 = (void *)objc_msgSend((id)objc_opt_class(), "_namedDataPrivateAccessorWithName:bundle:", name, bundle);
    else
      v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1A6A8], "defaultUICatalogForBundle:", bundle), "dataWithName:", name);
    v9 = v8;
    v7->_namedData = v9;
    if (!v9)
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSDataAsset;
  -[NSDataAsset dealloc](&v3, sel_dealloc);
}

- (NSDataAsset)init
{
  -[NSDataAsset doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSDataAsset)initWithName:(NSDataAssetName)name
{
  return -[NSDataAsset initWithName:bundle:](self, "initWithName:bundle:", name, objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"));
}

+ (id)_namedDataPrivateAccessorWithName:(id)a3 bundle:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1A6A8], "defaultUICatalogForBundle:", a4), "dataWithName:", a3);
}

- (NSDataAssetName)name
{
  NSDataAssetName result;

  result = (NSDataAssetName)-[CUINamedData name](self->_namedData, "name");
  if (!result)
    return (NSDataAssetName)&stru_1E260C7D0;
  return result;
}

- (unint64_t)hash
{
  return -[CUINamedData hash](self->_namedData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[CUINamedData isEqual:](self->_namedData, "isEqual:", *((_QWORD *)a3 + 1));
  else
    return 0;
}

- (id)description
{
  NSString *v3;
  NSString *v4;
  NSData *v5;
  objc_super v7;

  v3 = -[NSDataAsset name](self, "name");
  v4 = -[NSDataAsset typeIdentifier](self, "typeIdentifier");
  v5 = -[NSDataAsset data](self, "data");
  v7.receiver = self;
  v7.super_class = (Class)NSDataAsset;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ name:'%@' typeIdentifier='%@' data=%p (length=%lu)"), -[NSDataAsset description](&v7, sel_description), v3, v4, v5, -[NSData length](v5, "length"));
}

@end
