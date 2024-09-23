@implementation SUCoreScanParam

- (SUCoreScanParam)init
{
  SUCoreScanParam *v2;
  SUCoreScanParam *v3;
  NSError *error;
  SUCoreDescriptor *descriptor;
  SUCoreDescriptor *fallbackDescriptor;
  SUCoreDescriptor *majorPrimaryDescriptor;
  SUCoreDescriptor *majorSecondaryDescriptor;
  SUCoreDescriptor *minorPrimaryDescriptor;
  SUCoreDescriptor *minorSecondaryDescriptor;
  NSString *note;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUCoreScanParam;
  v2 = -[SUCoreScanParam init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    error = v2->_error;
    v2->_resultCode = 0;
    v2->_error = 0;

    descriptor = v3->_descriptor;
    v3->_descriptor = 0;

    fallbackDescriptor = v3->_fallbackDescriptor;
    v3->_fallbackDescriptor = 0;

    majorPrimaryDescriptor = v3->_majorPrimaryDescriptor;
    v3->_majorPrimaryDescriptor = 0;

    majorSecondaryDescriptor = v3->_majorSecondaryDescriptor;
    v3->_majorSecondaryDescriptor = 0;

    minorPrimaryDescriptor = v3->_minorPrimaryDescriptor;
    v3->_minorPrimaryDescriptor = 0;

    minorSecondaryDescriptor = v3->_minorSecondaryDescriptor;
    v3->_minorSecondaryDescriptor = 0;

    note = v3->_note;
    v3->_note = 0;

  }
  return v3;
}

- (SUCoreScanParam)initWithResult:(int64_t)a3 withError:(id)a4
{
  id v7;
  SUCoreScanParam *v8;
  SUCoreScanParam *v9;

  v7 = a4;
  v8 = -[SUCoreScanParam init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    v8->_resultCode = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (SUCoreScanParam)initWithDescriptor:(id)a3 withFallbackDescriptor:(id)a4
{
  id v7;
  id v8;
  SUCoreScanParam *v9;
  SUCoreScanParam *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[SUCoreScanParam init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    objc_storeStrong((id *)&v9->_descriptor, a3);
    objc_storeStrong((id *)&v10->_fallbackDescriptor, a4);
  }

  return v10;
}

- (SUCoreScanParam)initWithMajorPrimaryDescriptor:(id)a3 majorSecondaryDescriptor:(id)a4 minorPrimaryDescriptor:(id)a5 minorSecondaryDescriptor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SUCoreScanParam *v15;
  SUCoreScanParam *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[SUCoreScanParam init](self, "init");
  v16 = v15;
  if (v15)
  {
    v15->_type = 3;
    objc_storeStrong((id *)&v15->_majorPrimaryDescriptor, a3);
    objc_storeStrong((id *)&v16->_majorSecondaryDescriptor, a4);
    objc_storeStrong((id *)&v16->_minorPrimaryDescriptor, a5);
    objc_storeStrong((id *)&v16->_minorSecondaryDescriptor, a6);
  }

  return v16;
}

- (SUCoreScanParam)initWithNote:(id)a3
{
  id v5;
  SUCoreScanParam *v6;
  SUCoreScanParam *v7;

  v5 = a3;
  v6 = -[SUCoreScanParam init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_note, a3);
  }

  return v7;
}

- (SUCoreScanParam)initWithCoder:(id)a3
{
  id v4;
  SUCoreScanParam *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  SUCoreDescriptor *descriptor;
  uint64_t v12;
  SUCoreDescriptor *fallbackDescriptor;
  uint64_t v14;
  SUCoreDescriptor *majorPrimaryDescriptor;
  uint64_t v16;
  SUCoreDescriptor *majorSecondaryDescriptor;
  uint64_t v18;
  SUCoreDescriptor *minorPrimaryDescriptor;
  uint64_t v20;
  SUCoreDescriptor *minorSecondaryDescriptor;
  uint64_t v22;
  NSString *note;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUCoreScanParam;
  v5 = -[SUCoreScanParam init](&v25, sel_init);
  if (v5)
  {
    v5->_resultCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("resultCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildError:underlying:description:", v5->_resultCode, 0, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v10 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (SUCoreDescriptor *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackDescriptor"));
    v12 = objc_claimAutoreleasedReturnValue();
    fallbackDescriptor = v5->_fallbackDescriptor;
    v5->_fallbackDescriptor = (SUCoreDescriptor *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("majorPrimaryDescriptor"));
    v14 = objc_claimAutoreleasedReturnValue();
    majorPrimaryDescriptor = v5->_majorPrimaryDescriptor;
    v5->_majorPrimaryDescriptor = (SUCoreDescriptor *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("majorSecondaryDescriptor"));
    v16 = objc_claimAutoreleasedReturnValue();
    majorSecondaryDescriptor = v5->_majorSecondaryDescriptor;
    v5->_majorSecondaryDescriptor = (SUCoreDescriptor *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minorPrimaryDescriptor"));
    v18 = objc_claimAutoreleasedReturnValue();
    minorPrimaryDescriptor = v5->_minorPrimaryDescriptor;
    v5->_minorPrimaryDescriptor = (SUCoreDescriptor *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minorSecondaryDescriptor"));
    v20 = objc_claimAutoreleasedReturnValue();
    minorSecondaryDescriptor = v5->_minorSecondaryDescriptor;
    v5->_minorSecondaryDescriptor = (SUCoreDescriptor *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("note"));
    v22 = objc_claimAutoreleasedReturnValue();
    note = v5->_note;
    v5->_note = (NSString *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreScanParam resultCode](self, "resultCode"), CFSTR("resultCode"));
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreScanParam error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v6);

  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("error"));
  -[SUCoreScanParam descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("descriptor"));

  -[SUCoreScanParam fallbackDescriptor](self, "fallbackDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("fallbackDescriptor"));

  -[SUCoreScanParam majorPrimaryDescriptor](self, "majorPrimaryDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("majorPrimaryDescriptor"));

  -[SUCoreScanParam majorSecondaryDescriptor](self, "majorSecondaryDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("majorSecondaryDescriptor"));

  -[SUCoreScanParam minorPrimaryDescriptor](self, "minorPrimaryDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("minorPrimaryDescriptor"));

  -[SUCoreScanParam minorSecondaryDescriptor](self, "minorSecondaryDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("minorSecondaryDescriptor"));

  -[SUCoreScanParam note](self, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("note"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  switch(self->_type)
  {
    case 1:
      v3 = objc_alloc(MEMORY[0x1E0CB3940]);
      v4 = -[SUCoreScanParam resultCode](self, "resultCode");
      -[SUCoreScanParam error](self, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("\n[>>>\n                   resultCode: %ld\n                        error: %@\n<<<]"), v4, v5);

      break;
    case 2:
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreScanParam descriptor](self, "descriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "summary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam fallbackDescriptor](self, "fallbackDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "summary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("\n[>>>\n                   descriptor: %@\n           fallbackDescriptor: %@\n<<<]"), v9, v11);

      goto LABEL_7;
    case 3:
      v12 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreScanParam majorPrimaryDescriptor](self, "majorPrimaryDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "summary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam majorSecondaryDescriptor](self, "majorSecondaryDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "summary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam minorPrimaryDescriptor](self, "minorPrimaryDescriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "summary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam minorSecondaryDescriptor](self, "minorSecondaryDescriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "summary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("\n[>>>\n       majorPrimaryDescriptor: %@\n     majorSecondaryDescriptor: %@\n       minorPrimaryDescriptor: %@\n     minorSecondaryDescriptor: %@\n<<<]"), v14, v16, v18, v20);

      break;
    case 4:
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreScanParam note](self, "note");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("\n[>>>\n        note: %@\n<<<]"), v8);
LABEL_7:

      break;
    default:
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\n[>>>\n        NO_INFO: %d\n<<<]"), self->_type);
      break;
  }
  return v6;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resultCode:%ld"), -[SUCoreScanParam resultCode](self, "resultCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreScanParam error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(",errorDesc:%@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  -[SUCoreScanParam descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_6:
    -[SUCoreScanParam descriptor](self, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "summary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScanParam fallbackDescriptor](self, "fallbackDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "summary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(",descriptor:%@,fallbackDescriptor:%@"), v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v14;
    goto LABEL_7;
  }
  -[SUCoreScanParam fallbackDescriptor](self, "fallbackDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_6;
LABEL_7:
  -[SUCoreScanParam majorPrimaryDescriptor](self, "majorPrimaryDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    || (-[SUCoreScanParam majorSecondaryDescriptor](self, "majorSecondaryDescriptor"),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[SUCoreScanParam minorPrimaryDescriptor](self, "minorPrimaryDescriptor"),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[SUCoreScanParam minorSecondaryDescriptor](self, "minorSecondaryDescriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      return v3;
  }
  -[SUCoreScanParam majorPrimaryDescriptor](self, "majorPrimaryDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "summary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam majorSecondaryDescriptor](self, "majorSecondaryDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "summary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam minorPrimaryDescriptor](self, "minorPrimaryDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "summary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam minorSecondaryDescriptor](self, "minorSecondaryDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "summary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(",majorPrimaryDescriptor:%@,majorSecondaryDescriptor:%@,minorPrimaryDescriptor:%@,minorSecondaryDescriptor:%@"), v17, v19, v21, v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v24;
  return v3;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (SUCoreDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (SUCoreDescriptor)fallbackDescriptor
{
  return self->_fallbackDescriptor;
}

- (void)setFallbackDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackDescriptor, a3);
}

- (SUCoreDescriptor)majorPrimaryDescriptor
{
  return self->_majorPrimaryDescriptor;
}

- (void)setMajorPrimaryDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_majorPrimaryDescriptor, a3);
}

- (SUCoreDescriptor)majorSecondaryDescriptor
{
  return self->_majorSecondaryDescriptor;
}

- (void)setMajorSecondaryDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_majorSecondaryDescriptor, a3);
}

- (SUCoreDescriptor)minorPrimaryDescriptor
{
  return self->_minorPrimaryDescriptor;
}

- (void)setMinorPrimaryDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_minorPrimaryDescriptor, a3);
}

- (SUCoreDescriptor)minorSecondaryDescriptor
{
  return self->_minorSecondaryDescriptor;
}

- (void)setMinorSecondaryDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_minorSecondaryDescriptor, a3);
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_minorSecondaryDescriptor, 0);
  objc_storeStrong((id *)&self->_minorPrimaryDescriptor, 0);
  objc_storeStrong((id *)&self->_majorSecondaryDescriptor, 0);
  objc_storeStrong((id *)&self->_majorPrimaryDescriptor, 0);
  objc_storeStrong((id *)&self->_fallbackDescriptor, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
