@implementation ICJSSignConfiguration

+ (id)storePlatformConfiguration
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "includeHeaderWithName:", CFSTR("X-JS-TIMESTAMP"));
  objc_msgSend(v2, "includeHeaderWithName:", CFSTR("X-Apple-Store-Front"));
  objc_msgSend(v2, "includeQueryItemWithName:", CFSTR("caller"));
  objc_msgSend(v2, "includeQueryItemWithName:", CFSTR("id"));
  objc_msgSend(v2, "includeQueryItemWithName:", CFSTR("p"));
  objc_msgSend(v2, "setSignatureDataHeaderName:", CFSTR("X-JS-SP-TOKEN"));
  return v2;
}

- (void)includeCookieWithName:(id)a3
{
  -[ICJSSignConfiguration _addRequestComponent:withName:](self, "_addRequestComponent:withName:", 0, a3);
}

- (void)includeHeaderWithName:(id)a3
{
  -[ICJSSignConfiguration _addRequestComponent:withName:](self, "_addRequestComponent:withName:", 1, a3);
}

- (void)includeQueryItemWithName:(id)a3
{
  -[ICJSSignConfiguration _addRequestComponent:withName:](self, "_addRequestComponent:withName:", 2, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSMutableArray mutableCopyWithZone:](self->_componentNames, "mutableCopyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSMutableArray mutableCopyWithZone:](self->_components, "mutableCopyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSString copyWithZone:](self->_signatureDataCookieName, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = -[NSString copyWithZone:](self->_signatureDataHeaderName, "copyWithZone:", a3);
    v13 = (void *)v5[4];
    v5[4] = v12;

  }
  return v5;
}

- (void)_addRequestComponent:(int64_t)a3 withName:(id)a4
{
  id v6;
  NSMutableArray *componentNames;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *components;
  void *v12;
  id v13;

  v6 = a4;
  componentNames = self->_componentNames;
  v13 = v6;
  if (!componentNames)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = self->_componentNames;
    self->_componentNames = v8;

    v6 = v13;
    componentNames = self->_componentNames;
  }
  -[NSMutableArray addObject:](componentNames, "addObject:", v6);
  if (!self->_components)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    components = self->_components;
    self->_components = v10;

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
  -[NSMutableArray addObject:](self->_components, "addObject:", v12);

}

- (void)_enumerateComponentsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *components;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  components = self->_components;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ICJSSignConfiguration__enumerateComponentsUsingBlock___block_invoke;
  v7[3] = &unk_1E4389900;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](components, "enumerateObjectsUsingBlock:", v7);

}

- (NSString)signatureDataCookieName
{
  return self->_signatureDataCookieName;
}

- (void)setSignatureDataCookieName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)signatureDataHeaderName
{
  return self->_signatureDataHeaderName;
}

- (void)setSignatureDataHeaderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureDataHeaderName, 0);
  objc_storeStrong((id *)&self->_signatureDataCookieName, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_componentNames, 0);
}

void __56__ICJSSignConfiguration__enumerateComponentsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;

  v7 = *(_QWORD *)(a1 + 40);
  v8 = objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v7 + 16))(v7, v8, v9, a4);

}

@end
