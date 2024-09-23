@implementation RTIInputSystemDataPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTIInputSystemDataPayload)initWithCoder:(id)a3
{
  RTIInputSystemDataPayload *v3;
  RTIInputSystemDataPayload *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTIInputSystemDataPayload;
  v3 = -[RTIDataPayload initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[RTIInputSystemDataPayload _unarchiveData](v3, "_unarchiveData");
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RTIInputSystemDataPayload *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = [RTIInputSystemDataPayload alloc];
  -[RTIInputSystemDataPayload data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTIDataPayload initWithData:version:](v4, "initWithData:version:", v5, -[RTIDataPayload version](self, "version"));

  v7 = -[NSUUID copy](self->_sessionUUID, "copy");
  v8 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v7;

  *(_BYTE *)(v6 + 24) = self->_disableUpdate;
  v9 = -[RTIDocumentState copy](self->_documentState, "copy");
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[RTIDocumentTraits copy](self->_documentTraits, "copy");
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  RTIInputSystemDataPayload *v4;
  unsigned __int8 *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  objc_super v32;

  v4 = (RTIInputSystemDataPayload *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v32.receiver = self;
      v32.super_class = (Class)RTIInputSystemDataPayload;
      if (-[RTIDataPayload isEqual:](&v32, sel_isEqual_, v5))
      {
        -[RTIInputSystemDataPayload sessionUUID](self, "sessionUUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sessionUUID");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v6 == (void *)v7)
        {

        }
        else
        {
          v8 = (void *)v7;
          -[RTIInputSystemDataPayload sessionUUID](self, "sessionUUID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "sessionUUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (!v11)
            goto LABEL_20;
        }
        -[RTIInputSystemDataPayload documentState](self, "documentState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "documentState");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v13 == (void *)v14)
        {

        }
        else
        {
          v15 = (void *)v14;
          -[RTIInputSystemDataPayload documentState](self, "documentState");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "documentState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (!v18)
            goto LABEL_20;
        }
        -[RTIInputSystemDataPayload documentTraits](self, "documentTraits");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "documentTraits");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v19 == (void *)v20)
        {

        }
        else
        {
          v21 = (void *)v20;
          -[RTIInputSystemDataPayload documentTraits](self, "documentTraits");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "documentTraits");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (!v24)
            goto LABEL_20;
        }
        -[RTIInputSystemDataPayload textOperations](self, "textOperations");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "textOperations");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v25 == (void *)v26)
        {

        }
        else
        {
          v27 = (void *)v26;
          -[RTIInputSystemDataPayload textOperations](self, "textOperations");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "textOperations");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqual:", v29);

          if (!v30)
            goto LABEL_20;
        }
        v12 = self->_disableUpdate == v5[24];
        goto LABEL_21;
      }
LABEL_20:
      v12 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v12 = 0;
  }
LABEL_22:

  return v12;
}

+ (id)payloadWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:version:", v4, 1);

  objc_msgSend(v5, "_unarchiveData");
  return v5;
}

+ (id)payloadWithData:(id)a3 version:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:version:", v6, a4);

  objc_msgSend(v7, "_unarchiveData");
  return v7;
}

- (id)data
{
  void *v3;
  objc_super v5;
  objc_super v6;

  if (!self->_disableUpdate)
  {
    v6.receiver = self;
    v6.super_class = (Class)RTIInputSystemDataPayload;
    -[RTIDataPayload data](&v6, sel_data);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[RTIInputSystemDataPayload updateData](self, "updateData");
  }
  v5.receiver = self;
  v5.super_class = (Class)RTIInputSystemDataPayload;
  -[RTIDataPayload data](&v5, sel_data);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateData
{
  void *v3;
  id v4;
  RTIDocumentState *documentState;
  RTIDocumentTraits *documentTraits;
  RTITextOperations *textOperations;
  NSUUID *sessionUUID;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[RTIDocumentTraits fenceHandle](self->_documentTraits, "fenceHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[NSKeyedArchiver initRequiringSecureCoding:]([RTIKeyedArchiver alloc], "initRequiringSecureCoding:", 1);
    objc_msgSend(v4, "setRtiVersion:", -[RTIDataPayload version](self, "version"));
    documentState = self->_documentState;
    if (documentState)
      objc_msgSend(v4, "encodeObject:forKey:", documentState, CFSTR("documentState"));
    documentTraits = self->_documentTraits;
    if (documentTraits)
      objc_msgSend(v4, "encodeObject:forKey:", documentTraits, CFSTR("documentTraits"));
    textOperations = self->_textOperations;
    if (textOperations)
      objc_msgSend(v4, "encodeObject:forKey:", textOperations, CFSTR("textOperations"));
    sessionUUID = self->_sessionUUID;
    if (sessionUUID)
    {
      v11[0] = 0;
      v11[1] = 0;
      -[NSUUID getUUIDBytes:](sessionUUID, "getUUIDBytes:", v11);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, 16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sessionUUID"));

    }
    objc_msgSend(v4, "encodedData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIDataPayload setData:](self, "setData:", v10);

  }
}

- (void)_unarchiveData
{
  void *v3;
  RTIKeyedUnarchiver *v4;
  void *v5;
  RTIDocumentState *v6;
  RTIDocumentState *documentState;
  RTIDocumentTraits *v8;
  RTIDocumentTraits *documentTraits;
  RTITextOperations *v10;
  RTITextOperations *textOperations;
  void *v12;
  NSUUID *v13;
  NSUUID *sessionUUID;
  id v15;

  self->_disableUpdate = 1;
  -[RTIInputSystemDataPayload data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [RTIKeyedUnarchiver alloc];
    -[RTIInputSystemDataPayload data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[RTIKeyedUnarchiver initForReadingFromData:error:](v4, "initForReadingFromData:error:", v5, 0);

    objc_msgSend(v15, "setRtiVersion:", -[RTIDataPayload version](self, "version"));
    objc_msgSend(v15, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentState"));
    v6 = (RTIDocumentState *)objc_claimAutoreleasedReturnValue();
    documentState = self->_documentState;
    self->_documentState = v6;

    objc_msgSend(v15, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentTraits"));
    v8 = (RTIDocumentTraits *)objc_claimAutoreleasedReturnValue();
    documentTraits = self->_documentTraits;
    self->_documentTraits = v8;

    objc_msgSend(v15, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textOperations"));
    v10 = (RTITextOperations *)objc_claimAutoreleasedReturnValue();
    textOperations = self->_textOperations;
    self->_textOperations = v10;

    objc_msgSend(v15, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v12), "bytes"));
      sessionUUID = self->_sessionUUID;
      self->_sessionUUID = v13;

    }
  }
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
  objc_storeStrong((id *)&self->_documentTraits, a3);
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
}

- (RTITextOperations)textOperations
{
  return self->_textOperations;
}

- (void)setTextOperations:(id)a3
{
  objc_storeStrong((id *)&self->_textOperations, a3);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_textOperations, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end
