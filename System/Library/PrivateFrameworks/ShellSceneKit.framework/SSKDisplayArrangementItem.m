@implementation SSKDisplayArrangementItem

- (SSKDisplayArrangementItem)initWithRelativeDisplayIdentity:(id)a3 edge:(unsigned int)a4 offset:(double)a5
{
  id v9;
  SSKDisplayArrangementItem *v10;
  SSKDisplayArrangementItem *v11;
  SSKDisplayArrangementItem *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSKDisplayArrangementItem;
  v10 = -[SSKDisplayArrangementItem init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_relativeDisplayIdentity, a3);
    v11->_edge = a4;
    v11->_offset = a5;
  }
  v12 = -[SSKDisplayArrangementItem init](v11, "init");

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_relativeDisplayIdentity);
  v5 = (id)objc_msgSend(v3, "appendInt64:", self->_edge);
  v6 = (id)objc_msgSend(v3, "appendCGFloat:", self->_offset);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  FBSDisplayIdentity *relativeDisplayIdentity;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t edge;
  id v11;
  id v12;
  double offset;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  relativeDisplayIdentity = self->_relativeDisplayIdentity;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __37__SSKDisplayArrangementItem_isEqual___block_invoke;
  v21[3] = &unk_25171C230;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", relativeDisplayIdentity, v21);
  edge = self->_edge;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __37__SSKDisplayArrangementItem_isEqual___block_invoke_2;
  v19[3] = &unk_25171C258;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendInt64:counterpart:", edge, v19);
  offset = self->_offset;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __37__SSKDisplayArrangementItem_isEqual___block_invoke_3;
  v17[3] = &unk_25171C280;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v17, offset);
  LOBYTE(v11) = objc_msgSend(v5, "isEqual");

  return (char)v11;
}

id __37__SSKDisplayArrangementItem_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __37__SSKDisplayArrangementItem_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16);
}

double __37__SSKDisplayArrangementItem_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 24);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSKDisplayArrangementItem)initWithCoder:(id)a3
{
  id v4;
  SSKDisplayArrangementItem *v5;
  uint64_t v6;
  FBSDisplayIdentity *relativeDisplayIdentity;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSKDisplayArrangementItem;
  v5 = -[SSKDisplayArrangementItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relativeDisplayIdentity"));
    v6 = objc_claimAutoreleasedReturnValue();
    relativeDisplayIdentity = v5->_relativeDisplayIdentity;
    v5->_relativeDisplayIdentity = (FBSDisplayIdentity *)v6;

    v5->_edge = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("edge"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("offset"));
    v5->_offset = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  FBSDisplayIdentity *relativeDisplayIdentity;
  id v5;

  relativeDisplayIdentity = self->_relativeDisplayIdentity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relativeDisplayIdentity, CFSTR("relativeDisplayIdentity"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_edge, CFSTR("edge"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("offset"), self->_offset);

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  uint64_t edge;
  __CFString *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SSKDisplayArrangementItem *v11;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__SSKDisplayArrangementItem_appendDescriptionToFormatter___block_invoke;
  v9[3] = &unk_25171C128;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v8, "appendProem:block:", self, v9);
  edge = (int)self->_edge;
  if (edge > 3)
    v6 = 0;
  else
    v6 = off_25171C2A0[edge];
  objc_msgSend(v8, "appendString:withName:", v6, CFSTR("toThe"));
  v7 = (id)objc_msgSend(v8, "appendFloat:withName:", CFSTR("offset"), self->_offset);

}

id __58__SSKDisplayArrangementItem_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("from"));
}

- (FBSDisplayIdentity)relativeDisplayIdentity
{
  return self->_relativeDisplayIdentity;
}

- (unsigned)edge
{
  return self->_edge;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeDisplayIdentity, 0);
}

@end
