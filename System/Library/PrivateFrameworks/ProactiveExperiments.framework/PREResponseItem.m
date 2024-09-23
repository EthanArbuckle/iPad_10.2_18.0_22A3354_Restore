@implementation PREResponseItem

- (PREResponseItem)initWithCategoryId:(id)a3 modelId:(id)a4 responseClassId:(id)a5 replySubgroupId:(id)a6 replyTextId:(id)a7 replyText:(id)a8 language:(id)a9 isCustomResponse:(id)a10 isRobotResponse:(id)a11
{
  id v18;
  PREResponseItem *v19;
  PREResponseItem *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)PREResponseItem;
  v19 = -[PREResponseItem init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_categoryId, a3);
    objc_storeStrong((id *)&v20->_modelId, a4);
    objc_storeStrong((id *)&v20->_responseClassId, a5);
    objc_storeStrong((id *)&v20->_replySubgroupId, a6);
    objc_storeStrong((id *)&v20->_replyTextId, a7);
    objc_storeStrong((id *)&v20->_replyText, a8);
    objc_storeStrong((id *)&v20->_language, a9);
    objc_storeStrong((id *)&v20->_isCustomResponse, a10);
    objc_storeStrong((id *)&v20->_isRobotResponse, a11);
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *categoryId;
  id v5;

  categoryId = self->_categoryId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", categoryId, CFSTR("categoryId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelId, CFSTR("modelId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseClassId, CFSTR("responseClassId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_replySubgroupId, CFSTR("replySubgroupId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_replyTextId, CFSTR("replyTextId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_replyText, CFSTR("replyText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_language, CFSTR("language"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isCustomResponse, CFSTR("isCustomResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isRobotResponse, CFSTR("isRobotResponse"));

}

- (PREResponseItem)initWithCoder:(id)a3
{
  id v4;
  PREResponseItem *v5;
  uint64_t v6;
  NSNumber *categoryId;
  uint64_t v8;
  NSNumber *modelId;
  uint64_t v10;
  NSNumber *responseClassId;
  uint64_t v12;
  NSNumber *replySubgroupId;
  uint64_t v14;
  NSNumber *replyTextId;
  uint64_t v16;
  NSString *replyText;
  uint64_t v18;
  NSString *language;
  uint64_t v20;
  NSNumber *isCustomResponse;
  uint64_t v22;
  NSNumber *isRobotResponse;
  PREResponseItem *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PREResponseItem;
  v5 = -[PREResponseItem init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryId"));
    v6 = objc_claimAutoreleasedReturnValue();
    categoryId = v5->_categoryId;
    v5->_categoryId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelId"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelId = v5->_modelId;
    v5->_modelId = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseClassId"));
    v10 = objc_claimAutoreleasedReturnValue();
    responseClassId = v5->_responseClassId;
    v5->_responseClassId = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replySubgroupId"));
    v12 = objc_claimAutoreleasedReturnValue();
    replySubgroupId = v5->_replySubgroupId;
    v5->_replySubgroupId = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replyTextId"));
    v14 = objc_claimAutoreleasedReturnValue();
    replyTextId = v5->_replyTextId;
    v5->_replyTextId = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replyText"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v24 = 0;
      goto LABEL_6;
    }
    replyText = v5->_replyText;
    v5->_replyText = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v18 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCustomResponse"));
    v20 = objc_claimAutoreleasedReturnValue();
    isCustomResponse = v5->_isCustomResponse;
    v5->_isCustomResponse = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRobotResponse"));
    v22 = objc_claimAutoreleasedReturnValue();
    isRobotResponse = v5->_isRobotResponse;
    v5->_isRobotResponse = (NSNumber *)v22;

  }
  v24 = v5;
LABEL_6:

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  PREResponseItem *v4;
  PREResponseItem *v5;
  BOOL v6;

  v4 = (PREResponseItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PREResponseItem isEqualToResponseItem:](self, "isEqualToResponseItem:", v5);

  return v6;
}

- (BOOL)isEqualToResponseItem:(id)a3
{
  id *v4;
  id *v5;
  NSNumber *categoryId;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  char v10;
  NSNumber *modelId;
  NSNumber *v12;
  NSNumber *v13;
  NSNumber *v14;
  char v15;
  NSNumber *responseClassId;
  NSNumber *v17;
  NSNumber *v18;
  NSNumber *v19;
  char v20;
  NSNumber *replySubgroupId;
  NSNumber *v22;
  NSNumber *v23;
  NSNumber *v24;
  char v25;
  NSNumber *replyTextId;
  NSNumber *v27;
  NSNumber *v28;
  NSNumber *v29;
  char v30;
  NSString *replyText;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  char v35;
  NSString *language;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  char v40;
  NSNumber *isCustomResponse;
  NSNumber *v42;
  NSNumber *v43;
  NSNumber *v44;
  char v45;
  char v46;
  NSNumber *v48;
  NSNumber *v49;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_32;
  categoryId = self->_categoryId;
  v7 = (NSNumber *)v4[1];
  if (categoryId == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = categoryId;
    v10 = -[NSNumber isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_32;
  }
  modelId = self->_modelId;
  v12 = (NSNumber *)v5[2];
  if (modelId == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = modelId;
    v15 = -[NSNumber isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_32;
  }
  responseClassId = self->_responseClassId;
  v17 = (NSNumber *)v5[3];
  if (responseClassId == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = responseClassId;
    v20 = -[NSNumber isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_32;
  }
  replySubgroupId = self->_replySubgroupId;
  v22 = (NSNumber *)v5[4];
  if (replySubgroupId == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = replySubgroupId;
    v25 = -[NSNumber isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_32;
  }
  replyTextId = self->_replyTextId;
  v27 = (NSNumber *)v5[5];
  if (replyTextId == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = replyTextId;
    v30 = -[NSNumber isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_32;
  }
  replyText = self->_replyText;
  v32 = (NSString *)v5[6];
  if (replyText == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = replyText;
    v35 = -[NSString isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_32;
  }
  language = self->_language;
  v37 = (NSString *)v5[7];
  if (language == v37)
  {

  }
  else
  {
    v38 = v37;
    v39 = language;
    v40 = -[NSString isEqual:](v39, "isEqual:", v38);

    if ((v40 & 1) == 0)
      goto LABEL_32;
  }
  isCustomResponse = self->_isCustomResponse;
  v42 = (NSNumber *)v5[8];
  if (isCustomResponse == v42)
  {

  }
  else
  {
    v43 = v42;
    v44 = isCustomResponse;
    v45 = -[NSNumber isEqual:](v44, "isEqual:", v43);

    if ((v45 & 1) == 0)
    {
LABEL_32:
      v46 = 0;
      goto LABEL_33;
    }
  }
  v48 = self->_isRobotResponse;
  v49 = v48;
  if (v48 == v5[9])
    v46 = 1;
  else
    v46 = -[NSNumber isEqual:](v48, "isEqual:");

LABEL_33:
  return v46;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("categoryId: %@, modelId: %@, responseClassId: %@, replySubgroupId: %@, replyTextId: %@, replyText: %@, language: %@, isCustomResponse: %@, isRobotResponse %@"), self->_categoryId, self->_modelId, self->_responseClassId, self->_replySubgroupId, self->_replyTextId, self->_replyText, self->_language, self->_isCustomResponse, self->_isRobotResponse);
}

- (NSNumber)categoryId
{
  return self->_categoryId;
}

- (NSNumber)modelId
{
  return self->_modelId;
}

- (NSNumber)responseClassId
{
  return self->_responseClassId;
}

- (NSNumber)replySubgroupId
{
  return self->_replySubgroupId;
}

- (NSNumber)replyTextId
{
  return self->_replyTextId;
}

- (NSString)replyText
{
  return self->_replyText;
}

- (NSString)language
{
  return self->_language;
}

- (NSNumber)isCustomResponse
{
  return self->_isCustomResponse;
}

- (NSNumber)isRobotResponse
{
  return self->_isRobotResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isRobotResponse, 0);
  objc_storeStrong((id *)&self->_isCustomResponse, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_replyText, 0);
  objc_storeStrong((id *)&self->_replyTextId, 0);
  objc_storeStrong((id *)&self->_replySubgroupId, 0);
  objc_storeStrong((id *)&self->_responseClassId, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_categoryId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)responseItemArrayFromResponseKitArray:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  PREResponseItem *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    v13 = MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v15 = -[PREResponseItem initWithCategoryId:modelId:responseClassId:replySubgroupId:replyTextId:replyText:language:isCustomResponse:isRobotResponse:]([PREResponseItem alloc], "initWithCategoryId:modelId:responseClassId:replySubgroupId:replyTextId:replyText:language:isCustomResponse:isRobotResponse:", 0, 0, 0, 0, 0, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v7, v13, v13);
        objc_msgSend(v8, "addObject:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

@end
