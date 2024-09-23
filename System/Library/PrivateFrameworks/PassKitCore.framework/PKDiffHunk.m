@implementation PKDiffHunk

+ (id)hunkWithKey:(id)a3 oldValue:(id)a4 newValue:(id)a5 message:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKDiffHunk *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(PKDiffHunk);
  -[PKDiffHunk setKey:](v13, "setKey:", v12);

  -[PKDiffHunk setValueOld:](v13, "setValueOld:", v11);
  -[PKDiffHunk setValueNew:](v13, "setValueNew:", v10);

  -[PKDiffHunk setMessage:](v13, "setMessage:", v9);
  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;
  NSString *key;
  __int128 v6;
  NSString *message;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  key = self->_key;
  v6 = *(_OWORD *)&self->_oldValue;
  message = self->_message;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &key, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKCombinedHash(17, v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKDiffHunk *v4;
  PKDiffHunk *v5;
  BOOL v6;

  v4 = (PKDiffHunk *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKDiffHunk isEqualToDiffHunk:](self, "isEqualToDiffHunk:", v5);

  return v6;
}

- (BOOL)isEqualToDiffHunk:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (-[NSString isEqual:](self->_key, "isEqual:", v4[1])
    && objc_msgSend(self->_oldValue, "isEqual:", v4[2])
    && objc_msgSend(self->_newValue, "isEqual:", v4[3]))
  {
    v5 = -[NSString isEqual:](self->_message, "isEqual:", v4[4]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  NSComparisonResult v5;
  unint64_t v6;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSString compare:](self->_key, "compare:", v4[1]);
      if (v5 == NSOrderedSame)
      {
        v5 = objc_msgSend(self->_oldValue, "compare:", v4[2]);
        if (v5 == NSOrderedSame)
        {
          v5 = objc_msgSend(self->_newValue, "compare:", v4[3]);
          if (v5 == NSOrderedSame)
            v5 = -[NSString compare:](self->_message, "compare:", v4[4]);
        }
      }
    }
    else
    {
      v6 = objc_opt_class();
      if (v6 < objc_opt_class())
        v5 = NSOrderedAscending;
      else
        v5 = NSOrderedDescending;
    }
  }
  else
  {
    v5 = NSOrderedDescending;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiffHunk)initWithCoder:(id)a3
{
  id v4;
  PKDiffHunk *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiffHunk;
  v5 = -[PKDiffHunk init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiffHunk setKey:](v5, "setKey:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("oldValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiffHunk setValueOld:](v5, "setValueOld:", v12);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("newValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiffHunk setValueNew:](v5, "setValueNew:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiffHunk setMessage:](v5, "setMessage:", v14);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PKDiffHunk key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  -[PKDiffHunk valueOld](self, "valueOld");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("oldValue"));

  -[PKDiffHunk valueNew](self, "valueNew");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("newValue"));

  -[PKDiffHunk message](self, "message");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("message"));

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (id)valueOld
{
  return self->_oldValue;
}

- (void)setValueOld:(id)a3
{
  objc_storeStrong(&self->_oldValue, a3);
}

- (id)valueNew
{
  return self->_newValue;
}

- (void)setValueNew:(id)a3
{
  objc_storeStrong(&self->_newValue, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_newValue, 0);
  objc_storeStrong(&self->_oldValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
