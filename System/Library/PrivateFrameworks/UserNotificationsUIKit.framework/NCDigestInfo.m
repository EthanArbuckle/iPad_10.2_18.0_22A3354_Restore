@implementation NCDigestInfo

- (NCDigestInfo)initWithDigestInfo:(id)a3
{
  id v4;
  NCDigestInfo *v5;
  void *v6;
  uint64_t v7;
  NSDateComponents *scheduleTime;
  void *v9;
  uint64_t v10;
  NSDate *scheduleDate;
  void *v12;
  uint64_t v13;
  NSString *titleString;
  void *v15;
  uint64_t v16;
  NSString *headerString;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NCDigestInfo;
  v5 = -[NCDigestInfo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "scheduleTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    scheduleTime = v5->_scheduleTime;
    v5->_scheduleTime = (NSDateComponents *)v7;

    objc_msgSend(v4, "scheduleDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    scheduleDate = v5->_scheduleDate;
    v5->_scheduleDate = (NSDate *)v10;

    objc_msgSend(v4, "titleString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    titleString = v5->_titleString;
    v5->_titleString = (NSString *)v13;

    objc_msgSend(v4, "headerString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    headerString = v5->_headerString;
    v5->_headerString = (NSString *)v16;

    v5->_deliveryOrder = objc_msgSend(v4, "deliveryOrder");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  BOOL v14;

  v4 = a3;
  -[NCDigestInfo scheduleTime](self, "scheduleTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[NCDigestInfo scheduleDate](self, "scheduleDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDate:", v8))
    {
      -[NCDigestInfo titleString](self, "titleString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "titleString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[NCDigestInfo headerString](self, "headerString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "headerString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          v13 = -[NCDigestInfo deliveryOrder](self, "deliveryOrder");
          v14 = v13 == objc_msgSend(v4, "deliveryOrder");
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NSDateComponents hash](self->_scheduleTime, "hash");
  v4 = -[NSDate hash](self->_scheduleDate, "hash") + v3;
  v5 = -[NSString hash](self->_titleString, "hash");
  return v4 + v5 + -[NSString hash](self->_headerString, "hash") + self->_deliveryOrder;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCDigestInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCDigestInfo initWithDigestInfo:]([NCMutableDigestInfo alloc], "initWithDigestInfo:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCDigestInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  NCDigestInfo *v25;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[NCDigestInfo scheduleTime](self, "scheduleTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hour");
  -[NCDigestInfo scheduleTime](self, "scheduleTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("{h:%lu m:%lu}"), v9, objc_msgSend(v10, "minute"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLocale:", v13);

  objc_msgSend(v12, "setDateStyle:", 1);
  objc_msgSend(v12, "setTimeStyle:", 3);
  -[NCDigestInfo scheduleDate](self, "scheduleDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__NCDigestInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v21[3] = &unk_1E8D1DAE8;
  v16 = v6;
  v22 = v16;
  v23 = v11;
  v24 = v15;
  v25 = self;
  v17 = v15;
  v18 = v11;
  objc_msgSend(v16, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v21);

  v19 = v16;
  return v19;
}

void __54__NCDigestInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(a1 + 40), CFSTR("scheduleTime"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(a1 + 48), CFSTR("scheduleDate"));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "titleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("titleString"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "headerString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("headerString"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "_stringForDeliveryOrder:", objc_msgSend(*(id *)(a1 + 56), "deliveryOrder"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("deliveryOrder"));

}

- (id)_stringForDeliveryOrder:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E8D1DB08[a3];
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCDigestInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return -[NCDigestInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_1E8D21F60);
}

- (NSDateComponents)scheduleTime
{
  return self->_scheduleTime;
}

- (NSDate)scheduleDate
{
  return self->_scheduleDate;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)headerString
{
  return self->_headerString;
}

- (int64_t)deliveryOrder
{
  return self->_deliveryOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_scheduleDate, 0);
  objc_storeStrong((id *)&self->_scheduleTime, 0);
}

@end
