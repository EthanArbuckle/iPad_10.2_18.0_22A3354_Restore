@implementation PXSectionedObjectReference

- (PXSectionedObjectReference)initWithSectionObject:(id)a3 itemObject:(id)a4 subitemObject:(id)a5 indexPath:(PXSimpleIndexPath *)a6
{
  id v11;
  id v12;
  id v13;
  char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PXSectionedObjectReference;
  v14 = -[PXSectionedObjectReference init](&v27, sel_init);
  if (v14)
  {
    if (!v11 && !v12 && !v13)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("PXSectionedObjectReference.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(sectionObject == nil && itemObject == nil && subitemObject == nil)"));

    }
    v15 = objc_msgSend(v11, "copyWithZone:", 0);
    v16 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v15;

    v17 = objc_msgSend(v12, "copyWithZone:", 0);
    v18 = (void *)*((_QWORD *)v14 + 2);
    *((_QWORD *)v14 + 2) = v17;

    v19 = objc_msgSend(v13, "copyWithZone:", 0);
    v20 = (void *)*((_QWORD *)v14 + 3);
    *((_QWORD *)v14 + 3) = v19;

    v21 = *(_OWORD *)&a6->dataSourceIdentifier;
    *(_OWORD *)(v14 + 56) = *(_OWORD *)&a6->item;
    *(_OWORD *)(v14 + 40) = v21;
    v22 = (void *)*((_QWORD *)v14 + 3);
    if (v22 || (v22 = (void *)*((_QWORD *)v14 + 2)) != 0 || (v22 = (void *)*((_QWORD *)v14 + 1)) != 0)
    {
      v23 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)*((_QWORD *)v14 + 4);
    *((_QWORD *)v14 + 4) = v23;

  }
  return (PXSectionedObjectReference *)v14;
}

- (PXSimpleIndexPath)indexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[1].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (NSObject)sectionObject
{
  return self->_sectionObject;
}

- (NSObject)leafObject
{
  return self->_leafObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafObject, 0);
  objc_storeStrong((id *)&self->_subitemObject, 0);
  objc_storeStrong((id *)&self->_itemObject, 0);
  objc_storeStrong((id *)&self->_sectionObject, 0);
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  char v5;
  NSObject *sectionObject;
  NSObject *itemObject;
  NSObject *subitemObject;

  v4 = (char *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->_indexPath.dataSourceIdentifier, *(int64x2_t *)(v4 + 40)), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->_indexPath.item, *(int64x2_t *)(v4 + 56)))), 0xFuLL))) & 1) != 0&& ((sectionObject = self->_sectionObject, sectionObject == *((NSObject **)v4 + 1))|| -[NSObject isEqual:](sectionObject, "isEqual:"))&& ((itemObject = self->_itemObject, itemObject == *((NSObject **)v4 + 2))|| -[NSObject isEqual:](itemObject, "isEqual:")))
  {
    subitemObject = self->_subitemObject;
    if (subitemObject == *((NSObject **)v4 + 3))
      v5 = 1;
    else
      v5 = -[NSObject isEqual:](subitemObject, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PXSectionedObjectReference)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedObjectReference.m"), 14, CFSTR("%@ not supported"), v5);

  abort();
}

- (unint64_t)hash
{
  return -[NSObject hash](self->_leafObject, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v9[2];
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)PXSectionedObjectReference;
  -[PXSectionedObjectReference description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&self->_indexPath.item;
  v9[0] = *(_OWORD *)&self->_indexPath.dataSourceIdentifier;
  v9[1] = v5;
  PXSimpleIndexPathDescription(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ indexPath:%@ section:%@ item:%@ subitem:%@>"), v4, v6, self->_sectionObject, self->_itemObject, self->_subitemObject);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSObject)itemObject
{
  return self->_itemObject;
}

- (NSObject)subitemObject
{
  return self->_subitemObject;
}

@end
