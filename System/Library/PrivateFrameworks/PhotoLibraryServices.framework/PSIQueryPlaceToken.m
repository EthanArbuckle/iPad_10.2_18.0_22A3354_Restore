@implementation PSIQueryPlaceToken

- (PSIQueryPlaceToken)initWithText:(id)a3 locationNameByCategory:(id)a4
{
  id v6;
  PSIQueryPlaceToken *v7;
  uint64_t v8;
  NSDictionary *locationNameByCategory;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSIQueryPlaceToken;
  v7 = -[PSIQueryToken initWithText:userCategory:matchType:](&v11, sel_initWithText_userCategory_matchType_, a3, 9, 2);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    locationNameByCategory = v7->_locationNameByCategory;
    v7->_locationNameByCategory = (NSDictionary *)v8;

  }
  return v7;
}

- (PSIQueryPlaceToken)initWithCoder:(id)a3
{
  id v4;
  PSIQueryPlaceToken *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *locationNameByCategory;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSIQueryPlaceToken;
  v5 = -[PSIQueryToken initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("locationNameByCategory"));
    v10 = objc_claimAutoreleasedReturnValue();
    locationNameByCategory = v5->_locationNameByCategory;
    v5->_locationNameByCategory = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSIQueryPlaceToken;
  v4 = a3;
  -[PSIQueryToken encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_locationNameByCategory, CFSTR("locationNameByCategory"), v5.receiver, v5.super_class);

}

- (id)parentToken
{
  NSDictionary *locationNameByCategory;
  unint64_t v4;
  unint64_t v5;
  NSDictionary *v6;
  NSDictionary *v7;
  _QWORD v9[7];
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__72545;
  v15 = __Block_byref_object_dispose__72546;
  v10.receiver = self;
  v10.super_class = (Class)PSIQueryPlaceToken;
  -[PSIQueryToken parentToken](&v10, sel_parentToken);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  locationNameByCategory = (NSDictionary *)v12[5];
  if (!locationNameByCategory)
  {
    locationNameByCategory = self->_locationNameByCategory;
    if (locationNameByCategory)
    {
      v4 = -[PSIQueryToken userCategory](self, "userCategory");
      v5 = -[PSIQueryToken matchType](self, "matchType");
      v6 = self->_locationNameByCategory;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __33__PSIQueryPlaceToken_parentToken__block_invoke;
      v9[3] = &unk_1E3670930;
      v9[5] = v4;
      v9[6] = v5;
      v9[4] = &v11;
      PLSearchIndexEnumeratePlacesFromBigToSmall(v6, v9);
      -[PSIQueryToken setParentToken:](self, "setParentToken:", v12[5]);
      locationNameByCategory = (NSDictionary *)v12[5];
    }
  }
  v7 = locationNameByCategory;
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNameByCategory, 0);
}

void __33__PSIQueryPlaceToken_parentToken__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  PSIQueryToken *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = -[PSIQueryToken initWithText:userCategory:matchType:]([PSIQueryToken alloc], "initWithText:userCategory:matchType:", v3, a1[5], a1[6]);

  -[PSIQueryToken setParentToken:](v4, "setParentToken:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40));
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
