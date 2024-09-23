@implementation SBDisplayArrangementItem

- (SBDisplayArrangementItem)initWithDisplayIdentity:(id)a3 relativeDisplayIdentity:(id)a4 edge:(unsigned int)a5 offset:(double)a6
{
  id v12;
  id v13;
  void *v14;
  SBDisplayArrangementItem *v15;
  SBDisplayArrangementItem *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayArrangementItem.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayArrangementItem.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativeDisplayIdentity"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)SBDisplayArrangementItem;
  v15 = -[SBDisplayArrangementItem init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayIdentity, a3);
    objc_storeStrong((id *)&v16->_relativeDisplayIdentity, a4);
    v16->_edge = a5;
    v16->_offset = a6;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && -[FBSDisplayIdentity isEqual:](self->_displayIdentity, "isEqual:", *((_QWORD *)v4 + 2))
    && -[FBSDisplayIdentity isEqual:](self->_relativeDisplayIdentity, "isEqual:", *((_QWORD *)v4 + 3))
    && self->_edge == *((_DWORD *)v4 + 2)
    && self->_offset == *((double *)v4 + 4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_displayIdentity);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_relativeDisplayIdentity);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_edge);
  v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_offset);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__SBDisplayArrangementItem_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E8EB23F8;
  v3[4] = self;
  objc_msgSend(a3, "appendCustomFormatWithName:block:", CFSTR("layout"), v3);
}

uint64_t __57__SBDisplayArrangementItem_appendDescriptionToFormatter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(int *)(v2 + 8);
  if (v3 == 0.0)
  {
    if (v5 > 3)
      v7 = CFSTR("EAST");
    else
      v7 = off_1E8EB2418[v5];
    return objc_msgSend(a2, "appendFormat:", CFSTR("[%@] is to the %@ of [%@]"), v4, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v9);
  }
  else
  {
    if (v5 > 3)
      v6 = CFSTR("EAST");
    else
      v6 = off_1E8EB2418[v5];
    return objc_msgSend(a2, "appendFormat:", CFSTR("[%@] is %lu pts to the %@ of [%@]"), v4, *(_QWORD *)&v3, v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
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
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

+ (id)_preferredArrangementOfExternalDisplay:(id)a3 relativeToEmbeddedDisplay:(id)a4 preferences:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBDisplayArrangementItem *v12;
  uint64_t v13;
  SBDisplayArrangementItem *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBDisplayArrangementItem.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  if (objc_msgSend(v9, "sb_displayWindowingMode") == 1)
  {
    v12 = [SBDisplayArrangementItem alloc];
    v13 = objc_msgSend(v11, "arrangementEdge");
    objc_msgSend(v11, "arrangementOffset");
    v14 = -[SBDisplayArrangementItem initWithDisplayIdentity:relativeDisplayIdentity:edge:offset:](v12, "initWithDisplayIdentity:relativeDisplayIdentity:edge:offset:", v9, v10, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)preferredArrangementOfDisplay:(id)a3 relativeTo:(id)a4 preferences:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBDisplayArrangementItem *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  double v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBDisplayArrangementItem.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBDisplayArrangementItem.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativeDisplayIdentity"));

LABEL_3:
  if (objc_msgSend(v9, "sb_displayWindowingMode") != 1 || objc_msgSend(v10, "sb_displayWindowingMode") != 1)
    goto LABEL_10;
  if (objc_msgSend(v10, "isMainDisplay"))
  {
    +[SBDisplayArrangementItem _preferredArrangementOfExternalDisplay:relativeToEmbeddedDisplay:preferences:](SBDisplayArrangementItem, "_preferredArrangementOfExternalDisplay:relativeToEmbeddedDisplay:preferences:", v9, v10, v11);
    v12 = (SBDisplayArrangementItem *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!objc_msgSend(v9, "isMainDisplay"))
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  +[SBDisplayArrangementItem _preferredArrangementOfExternalDisplay:relativeToEmbeddedDisplay:preferences:](SBDisplayArrangementItem, "_preferredArrangementOfExternalDisplay:relativeToEmbeddedDisplay:preferences:", v10, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "edge");
  if (v14 > 3)
    v15 = 0;
  else
    v15 = dword_1D0E89F90[v14];
  objc_msgSend(v13, "offset");
  v12 = -[SBDisplayArrangementItem initWithDisplayIdentity:relativeDisplayIdentity:edge:offset:]([SBDisplayArrangementItem alloc], "initWithDisplayIdentity:relativeDisplayIdentity:edge:offset:", v9, v10, v15, -v17);

LABEL_11:
  return v12;
}

@end
