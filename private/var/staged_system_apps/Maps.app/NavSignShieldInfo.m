@implementation NavSignShieldInfo

- (NavSignShieldInfo)initWithShieldID:(int)a3 shieldStringID:(id)a4 shieldText:(id)a5
{
  id v8;
  id v9;
  NavSignShieldInfo *v10;
  NavSignShieldInfo *v11;
  NavSignShieldInfo *v12;
  NSString *v13;
  NSString *shieldStringID;
  NSString *v15;
  NSString *shieldText;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  if (a3 || v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)NavSignShieldInfo;
    v11 = -[NavSignShieldInfo init](&v18, "init");
    v12 = v11;
    if (v11)
    {
      v11->_shieldID = a3;
      v13 = (NSString *)objc_msgSend(v8, "copy");
      shieldStringID = v12->_shieldStringID;
      v12->_shieldStringID = v13;

      v15 = (NSString *)objc_msgSend(v9, "copy");
      shieldText = v12->_shieldText;
      v12->_shieldText = v15;

    }
    self = v12;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(NavSignShieldInfo);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = objc_msgSend(v6, "shieldID");
      if (v7 == -[NavSignShieldInfo shieldID](self, "shieldID"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldStringID](self, "shieldStringID"));
        v9 = objc_msgSend(v8, "length");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shieldStringID"));
        v11 = v10;
        if (v9)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldStringID](self, "shieldStringID"));
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v13)
          {
LABEL_6:
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldText](self, "shieldText"));
            v15 = objc_msgSend(v14, "length");
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shieldText"));
            v17 = v16;
            if (v15)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldText](self, "shieldText"));
              v19 = objc_msgSend(v17, "isEqualToString:", v18);

            }
            else
            {
              v19 = objc_msgSend(v16, "length") == 0;
            }

            goto LABEL_13;
          }
        }
        else
        {
          v20 = objc_msgSend(v10, "length");

          if (!v20)
            goto LABEL_6;
        }
      }
      v19 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[NavSignShieldInfo shieldID](self, "shieldID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldStringID](self, "shieldStringID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldText](self, "shieldText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("shieldID: [%d] strID: [%@] text: [%@]"), v3, v4, v5));

  return v6;
}

- (unint64_t)hash
{
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[NavSignShieldInfo shieldID](self, "shieldID");
  v4 = -[NavSignShieldInfo shieldID](self, "shieldID");
  if (v3 >= 0)
    v5 = v4;
  else
    v5 = -v4;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldStringID](self, "shieldStringID"));
  v8 = (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldText](self, "shieldText"));
  v10 = v8 ^ (unint64_t)objc_msgSend(v9, "hash") ^ v6;

  return v10;
}

- (id)_car_shieldImageWithSize:(int64_t)a3 scale:(double)a4 displayedInDashboard:(BOOL)a5 nightMode:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;

  v6 = a6;
  v7 = a5;
  if (-[NavSignShieldInfo shieldID](self, "shieldID"))
  {
    v11 = objc_alloc_init((Class)VKIconModifiers);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldText](self, "shieldText"));
    objc_msgSend(v11, "setText:", v12);

    objc_msgSend(v11, "setNavMode:", 1);
    if (v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
      objc_msgSend(v11, "setVariant:", objc_msgSend(v13, "darkVariant"));

    }
    v14 = -[NavSignShieldInfo shieldID](self, "shieldID");
    if (v7)
      v15 = 6;
    else
      v15 = 7;
    v16 = v15 | 0x4BAF0;
    if (v14 == 310000)
      v17 = v16;
    else
      v17 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldText](self, "shieldText"));
    *(float *)&v20 = a4;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v17, v19, a3, v11, v20));

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldImageWithSize:scale:idiom:](self, "shieldImageWithSize:scale:idiom:", a3, 1, a4));
  }
  return v21;
}

- (id)shieldImageWithSize:(int64_t)a3 scale:(double)a4 idiom:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;

  if (-[NavSignShieldInfo shieldID](self, "shieldID", a3, a5)
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldStringID](self, "shieldStringID")),
        v8,
        v8))
  {
    v9 = objc_alloc_init((Class)VKIconModifiers);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldText](self, "shieldText"));
    objc_msgSend(v9, "setText:", v10);

    v11 = -[NavSignShieldInfo shieldID](self, "shieldID");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
    if (v11)
    {
      v13 = -[NavSignShieldInfo shieldID](self, "shieldID");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldText](self, "shieldText"));
      *(float *)&v15 = a4;
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v13, v14, a3, v9, v15));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignShieldInfo shieldStringID](self, "shieldStringID"));
      *(float *)&v17 = a4;
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageForName:contentScale:sizeGroup:modifiers:", v14, a3, v9, v17));
    }
    v18 = (void *)v16;

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

+ (id)shieldWithID:(int)a3 stringID:(id)a4 text:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithShieldID:shieldStringID:shieldText:", v6, v9, v8);

  return v10;
}

- (int)shieldID
{
  return self->_shieldID;
}

- (NSString)shieldStringID
{
  return self->_shieldStringID;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_shieldStringID, 0);
}

@end
