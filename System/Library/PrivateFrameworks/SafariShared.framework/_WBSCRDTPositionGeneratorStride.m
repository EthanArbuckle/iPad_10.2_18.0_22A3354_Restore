@implementation _WBSCRDTPositionGeneratorStride

- (_WBSCRDTPositionGeneratorStride)initWithRecordNames:(id)a3 beforePosition:(id)a4 afterPosition:(id)a5
{
  id v8;
  id v9;
  id v10;
  _WBSCRDTPositionGeneratorStride *v11;
  uint64_t v12;
  NSArray *recordNames;
  _WBSCRDTPositionGeneratorStride *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_WBSCRDTPositionGeneratorStride;
  v11 = -[_WBSCRDTPositionGeneratorStride init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    recordNames = v11->_recordNames;
    v11->_recordNames = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_beforePosition, a4);
    objc_storeStrong((id *)&v11->_afterPosition, a5);
    v14 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSArray componentsJoinedByString:](self->_recordNames, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, record names: [ %@ ], before position: %@, after position: %@>"), v4, self, v5, self->_beforePosition, self->_afterPosition);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)recordNames
{
  return self->_recordNames;
}

- (WBSCRDTPosition)beforePosition
{
  return self->_beforePosition;
}

- (WBSCRDTPosition)afterPosition
{
  return self->_afterPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterPosition, 0);
  objc_storeStrong((id *)&self->_beforePosition, 0);
  objc_storeStrong((id *)&self->_recordNames, 0);
}

@end
