@implementation SFIndexState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFIndexState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBIndexState *v6;
  SFIndexState *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBIndexState initWithData:]([_SFPBIndexState alloc], "initWithData:", v5);
  v7 = -[SFIndexState initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBIndexState *v6;

  v4 = a3;
  v6 = -[_SFPBIndexState initWithFacade:]([_SFPBIndexState alloc], "initWithFacade:", self);
  -[_SFPBIndexState data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBIndexState *v2;
  void *v3;

  v2 = -[_SFPBIndexState initWithFacade:]([_SFPBIndexState alloc], "initWithFacade:", self);
  -[_SFPBIndexState dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBIndexState *v2;
  void *v3;

  v2 = -[_SFPBIndexState initWithFacade:]([_SFPBIndexState alloc], "initWithFacade:", self);
  -[_SFPBIndexState jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFIndexState percentMessagesIndexed](self, "percentMessagesIndexed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPercentMessagesIndexed:", v6);

  -[SFIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPercentAttachmentsIndexed:", v8);

  -[SFIndexState searchIndex](self, "searchIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSearchIndex:", v10);

  -[SFIndexState totalMessageCount](self, "totalMessageCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setTotalMessageCount:", v12);

  -[SFIndexState indexedMessageCount](self, "indexedMessageCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setIndexedMessageCount:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFIndexState *v4;
  SFIndexState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
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
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = (SFIndexState *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[SFIndexState isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFIndexState percentMessagesIndexed](self, "percentMessagesIndexed");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFIndexState percentMessagesIndexed](v5, "percentMessagesIndexed");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v10 = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[SFIndexState percentMessagesIndexed](self, "percentMessagesIndexed");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFIndexState percentMessagesIndexed](self, "percentMessagesIndexed");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFIndexState percentMessagesIndexed](v5, "percentMessagesIndexed");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_35;
        }
        v46 = v9;
      }
      -[SFIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFIndexState percentAttachmentsIndexed](v5, "percentAttachmentsIndexed");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v48 == 0) != (v11 != 0))
      {
        -[SFIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          -[SFIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFIndexState percentAttachmentsIndexed](v5, "percentAttachmentsIndexed");
          v43 = v14;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "isEqual:"))
          {
            v10 = 0;
            v18 = v44;
            goto LABEL_32;
          }
          v45 = v13;
        }
        else
        {
          v45 = 0;
        }
        -[SFIndexState searchIndex](self, "searchIndex");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFIndexState searchIndex](v5, "searchIndex");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v15 == 0) != (v16 != 0))
        {
          v41 = v15;
          v42 = v16;
          -[SFIndexState searchIndex](self, "searchIndex");
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            -[SFIndexState searchIndex](self, "searchIndex");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFIndexState searchIndex](v5, "searchIndex");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v17;
            if (!objc_msgSend(v17, "isEqual:"))
            {
              v10 = 0;
              v13 = v45;
              v18 = v44;
              v19 = (void *)v40;
              goto LABEL_30;
            }
          }
          -[SFIndexState totalMessageCount](self, "totalMessageCount");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFIndexState totalMessageCount](v5, "totalMessageCount");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v20 == 0) == (v21 != 0))
          {

            v10 = 0;
            v13 = v45;
            v18 = v44;
            v19 = (void *)v40;
            if (!v40)
              goto LABEL_31;
            goto LABEL_30;
          }
          v36 = v21;
          v37 = v20;
          -[SFIndexState totalMessageCount](self, "totalMessageCount");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v44;
          if (v22)
          {
            -[SFIndexState totalMessageCount](self, "totalMessageCount");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFIndexState totalMessageCount](v5, "totalMessageCount");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v23;
            if (!objc_msgSend(v23, "isEqual:", v33))
            {
              v10 = 0;
              goto LABEL_48;
            }
            v35 = v22;
          }
          else
          {
            v35 = 0;
          }
          -[SFIndexState indexedMessageCount](self, "indexedMessageCount");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFIndexState indexedMessageCount](v5, "indexedMessageCount");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v25 == 0) == (v26 != 0))
          {

            v10 = 0;
            v18 = v44;
            v22 = v35;
            if (!v35)
            {
LABEL_49:

              v19 = (void *)v40;
              v13 = v45;
              if (!v40)
              {
LABEL_31:

                if (!v13)
                {
LABEL_33:

LABEL_34:
                  v9 = v46;
                  if (!v8)
                  {
LABEL_36:

                    goto LABEL_37;
                  }
LABEL_35:

                  goto LABEL_36;
                }
LABEL_32:

                goto LABEL_33;
              }
LABEL_30:

              goto LABEL_31;
            }
          }
          else
          {
            v31 = v26;
            v32 = v25;
            -[SFIndexState indexedMessageCount](self, "indexedMessageCount");
            v27 = objc_claimAutoreleasedReturnValue();
            v18 = v44;
            v22 = v35;
            if (v27)
            {
              v30 = (void *)v27;
              -[SFIndexState indexedMessageCount](self, "indexedMessageCount");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFIndexState indexedMessageCount](v5, "indexedMessageCount");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = objc_msgSend(v29, "isEqual:", v28);

              if (!v35)
                goto LABEL_49;
            }
            else
            {

              v10 = 1;
              if (!v35)
                goto LABEL_49;
            }
          }
LABEL_48:

          goto LABEL_49;
        }

        if (v45)
        {

        }
      }

      v10 = 0;
      goto LABEL_34;
    }
    v10 = 0;
  }
LABEL_38:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[SFIndexState percentMessagesIndexed](self, "percentMessagesIndexed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFIndexState searchIndex](self, "searchIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFIndexState totalMessageCount](self, "totalMessageCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[SFIndexState indexedMessageCount](self, "indexedMessageCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSNumber)percentMessagesIndexed
{
  return self->_percentMessagesIndexed;
}

- (void)setPercentMessagesIndexed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)percentAttachmentsIndexed
{
  return self->_percentAttachmentsIndexed;
}

- (void)setPercentAttachmentsIndexed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)searchIndex
{
  return self->_searchIndex;
}

- (void)setSearchIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)totalMessageCount
{
  return self->_totalMessageCount;
}

- (void)setTotalMessageCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)indexedMessageCount
{
  return self->_indexedMessageCount;
}

- (void)setIndexedMessageCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexedMessageCount, 0);
  objc_storeStrong((id *)&self->_totalMessageCount, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_percentAttachmentsIndexed, 0);
  objc_storeStrong((id *)&self->_percentMessagesIndexed, 0);
}

- (SFIndexState)initWithProtobuf:(id)a3
{
  id v4;
  SFIndexState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFIndexState *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFIndexState;
  v5 = -[SFIndexState init](&v13, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "percentMessagesIndexed"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "percentMessagesIndexed"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFIndexState setPercentMessagesIndexed:](v5, "setPercentMessagesIndexed:", v6);

    }
    if (objc_msgSend(v4, "percentAttachmentsIndexed"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "percentAttachmentsIndexed"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFIndexState setPercentAttachmentsIndexed:](v5, "setPercentAttachmentsIndexed:", v7);

    }
    if (objc_msgSend(v4, "searchIndex"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "searchIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFIndexState setSearchIndex:](v5, "setSearchIndex:", v8);

    }
    if (objc_msgSend(v4, "totalMessageCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "totalMessageCount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFIndexState setTotalMessageCount:](v5, "setTotalMessageCount:", v9);

    }
    if (objc_msgSend(v4, "indexedMessageCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "indexedMessageCount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFIndexState setIndexedMessageCount:](v5, "setIndexedMessageCount:", v10);

    }
    v11 = v5;
  }

  return v5;
}

@end
