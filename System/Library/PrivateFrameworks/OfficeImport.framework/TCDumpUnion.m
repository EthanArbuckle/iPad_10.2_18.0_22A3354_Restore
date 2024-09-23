@implementation TCDumpUnion

- (TCDumpUnion)initWithSelectorFieldName:(id)a3 selectorEnumType:(id)a4 selectorField:(id)a5 members:(id)a6
{
  id v11;
  id v12;
  id v13;
  TCDumpUnion *v14;
  TCDumpUnion *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *mSelectorToMemberMap;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  TCDumpField *v29;
  TCDumpUnion *v30;
  id v32;
  void *v33;
  id *p_mSelectorField;
  id *p_isa;
  objc_super v36;

  v11 = a3;
  v12 = a4;
  v32 = a5;
  v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)TCDumpUnion;
  v33 = v11;
  v14 = -[TCDumpType init](&v36, sel_init);
  p_isa = (id *)&v14->super.super.isa;
  if (v14)
  {
    v15 = v14;
    objc_storeStrong((id *)&v14->mSelectorFieldName, a3);
    p_mSelectorField = (id *)&v15->mSelectorField;
    objc_storeStrong((id *)&v15->mSelectorField, a5);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mSelectorToMemberMap = v15->mSelectorToMemberMap;
    v15->mSelectorToMemberMap = v16;

    v18 = objc_msgSend(v13, "count", v32);
    v19 = v12;
    if (v18 >= 3)
    {
      v20 = v18 / 3;
      v21 = 1;
      do
      {
        objc_msgSend(v13, "objectAtIndex:", v21 - 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "characterAtIndex:", 0);
        if (v23 <= 0x7F)
        {
          if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v23 + 60) & 0x400) == 0)
          {
LABEL_8:
            v25 = v19;
            if (!v19)
            {
              objc_msgSend(*p_mSelectorField, "enumType");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v19 = v25;
            objc_msgSend(v25, "valueForName:", v22);
            v24 = objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          }
        }
        else if (!__maskrune(v23, 0x400uLL))
        {
          goto LABEL_8;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v22, "intValue"));
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v26 = (void *)v24;
        objc_msgSend(v13, "objectAtIndex:", v21 + 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[TCDumpField initWithType:name:]([TCDumpField alloc], "initWithType:name:", v27, v28);
        objc_msgSend(p_isa[4], "setObject:forKey:", v29, v26);

        v21 += 3;
        --v20;
      }
      while (v20);
    }
  }
  else
  {
    v19 = v12;
  }
  v30 = p_isa;

  return v30;
}

- (TCDumpUnion)initWithSelectorFieldName:(id)a3 selectorEnumType:(id)a4 members:(id)a5
{
  return -[TCDumpUnion initWithSelectorFieldName:selectorEnumType:selectorField:members:](self, "initWithSelectorFieldName:selectorEnumType:selectorField:members:", a3, a4, 0, a5);
}

- (TCDumpUnion)initWithSelectorField:(id)a3 members:(id)a4
{
  return -[TCDumpUnion initWithSelectorFieldName:selectorEnumType:selectorField:members:](self, "initWithSelectorFieldName:selectorEnumType:selectorField:members:", 0, 0, a3, a4);
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  xmlNode *v13;
  void *v14;
  id v15;

  v8 = a5;
  v15 = v8;
  if (self->mSelectorFieldName)
    objc_msgSend(v8, "valueForField:");
  else
    readIntegerFromBinaryToXml(self->mSelectorField, (NSString *)CFSTR("selector"), a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->mSelectorToMemberMap, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "name");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = xmlNewNode(0, (const xmlChar *)objc_msgSend(v12, "UTF8String"));
    xmlAddChild(a4, v13);
    objc_msgSend(v11, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fromBinary:toXml:state:", a3, v13, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSelectorToMemberMap, 0);
  objc_storeStrong((id *)&self->mSelectorField, 0);
  objc_storeStrong((id *)&self->mSelectorFieldName, 0);
}

@end
