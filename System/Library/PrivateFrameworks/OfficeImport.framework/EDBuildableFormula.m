@implementation EDBuildableFormula

- (void)dealloc
{
  EDBuildablePtg *mTree;
  objc_super v4;

  mTree = self->mTree;
  if (mTree)
    (*((void (**)(EDBuildablePtg *, SEL))mTree->var0 + 1))(mTree, a2);
  v4.receiver = self;
  v4.super_class = (Class)EDBuildableFormula;
  -[EDBuildableFormula dealloc](&v4, sel_dealloc);
}

- (int)tokenTypeAtIndex:(unint64_t)a3
{
  EDBuildablePtg *v3;

  v3 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a3);
  if (v3)
    LODWORD(v3) = v3->var2;
  return (int)v3;
}

- (id)stringFromStringTokenAtIndex:(unint64_t)a3
{
  EDBuildablePtg *v3;
  OcText *OcTextFromPtgStr;
  void *v5;

  v3 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a3);
  if (v3 && v3->var2 == 23)
  {
    OcTextFromPtgStr = extractOcTextFromPtgStr((XlPtg *)&v3->var1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", OcTextFromPtgStr);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (OcTextFromPtgStr)
      (*((void (**)(OcText *))OcTextFromPtgStr->var0 + 1))(OcTextFromPtgStr);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)replaceStringInStringTokenAtIndex:(unint64_t)a3 content:(id)a4
{
  EDBuildablePtg *v6;
  EDBuildablePtg *v7;
  uint64_t v8;
  int v9;
  XlPtg *p_var1;
  unsigned __int8 *v11;
  id v12;

  v12 = a4;
  v6 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a3);
  v7 = v6;
  if (v6)
  {
    if (v6->var2 == 23)
    {
      v8 = objc_msgSend(v12, "length");
      v9 = v8;
      if (v8)
      {
        p_var1 = (XlPtg *)&v7->var1;
        XlPtg::clear(p_var1);
        v11 = (unsigned __int8 *)XlPtg::addDataItem(p_var1, 2 * v9 + 8);
        if (v11)
          copyStringToExtendedData((const unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v12), "cStringUsingEncoding:", 10), v11, (__int16)v9);
      }
    }
  }

}

- (void)removeTokenAtIndex:(unint64_t)a3
{
  EDBuildablePtg *v4;
  EDBuildablePtg *v5;
  EDBuildablePtg *v6;
  EDBuildablePtg *v7;

  v7 = 0;
  v4 = -[EDBuildableFormula tokenAtIndex:previousToken:](self, "tokenAtIndex:previousToken:", a3, &v7);
  if (v4)
  {
    v5 = v4;
    v6 = EDBuildablePtg::sibling(v4);
    EDBuildablePtg::setSibling(v5, 0);
    if (v7)
      EDBuildablePtg::setSibling(v7, v6);
    else
      self->mTree = v6;
    (*((void (**)(EDBuildablePtg *))v5->var0 + 1))(v5);
  }
}

- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4 numArgs:(int)a5
{
  uint64_t v8;
  unsigned __int16 v9;
  int v10;
  BOOL v11;
  int v12;
  EDBuildablePtg *mTree;
  int v14;
  EDBuildablePtg *v15;
  EDBuildablePtg *v16;

  if (a3 == 64)
  {
    v8 = operator new();
    EDBuildableArrayPtg::EDBuildableArrayPtg((EDBuildableArrayPtg *)v8, a5);
  }
  else
  {
    v9 = a4;
    v8 = operator new();
    EDBuildablePtg::EDBuildablePtg(v8, a3, v9);
  }
  v10 = categoryForType(a3);
  if (a5)
    v11 = v10 == 1;
  else
    v11 = 0;
  v12 = v11;
  if (a3 != 21 && !v12)
  {
    mTree = self->mTree;
LABEL_25:
    EDBuildablePtg::setSibling((EDBuildablePtg *)v8, mTree);
    goto LABEL_26;
  }
  if (a3 == 21)
    v14 = 1;
  else
    v14 = a5;
  EDBuildablePtg::setChild((EDBuildablePtg *)v8, self->mTree);
  if (v14 >= 1)
  {
    mTree = self->mTree;
    if (mTree)
    {
      while (1)
      {
        v15 = mTree;
        v16 = EDBuildablePtg::sibling(mTree);
        mTree = v16;
        if (!--v14)
          goto LABEL_24;
        if (!v16)
          goto LABEL_22;
      }
    }
    v15 = 0;
LABEL_22:
    -[EDBuildableFormula setWarning:](self, "setWarning:", 1);
    if (v15)
    {
      mTree = 0;
LABEL_24:
      EDBuildablePtg::setSibling(v15, 0);
      goto LABEL_25;
    }
  }
LABEL_26:
  self->mTree = (EDBuildablePtg *)v8;
  return XlPtg::getLastExtendedData((XlPtg *)(v8 + 8));
}

- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4
{
  return -[EDBuildableFormula addToken:extendedDataLength:numArgs:](self, "addToken:extendedDataLength:numArgs:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (BOOL)makeArrayForLastToken:(unint64_t)a3
{
  EDBuildablePtg *mTree;
  BOOL v4;
  unint64_t v5;
  EDBuildablePtg *v7;
  EDBuildablePtg *v8;
  int var2;
  EDBuildablePtg *v11;
  EDBuildablePtg *v12;

  mTree = self->mTree;
  if (mTree)
    v4 = a3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = a3;
    while (1)
    {
      v7 = EDBuildablePtg::sibling(mTree);
      if (!v7)
        break;
      v8 = v7;
      var2 = v7->var2;
      if ((var2 - 28) >= 4 && var2 != 23)
        break;
      v11 = EDBuildablePtg::sibling(v7);
      EDBuildablePtg::setSibling(v8, 0);
      EDBuildablePtg::setSibling(mTree, v11);
      v12 = (EDBuildablePtg *)EDBuildableArrayPtg::elements((EDBuildableArrayPtg *)mTree);
      EDBuildablePtg::setSibling(v8, v12);
      EDBuildableArrayPtg::setElements((uint64_t)mTree, v8);
      if (!--v5)
        return mTree != 0;
    }
    -[EDBuildableFormula setWarning:](self, "setWarning:", 1);
  }
  return mTree != 0;
}

- (BOOL)insertName:(unint64_t)a3 link:(unint64_t)a4 external:(BOOL)a5 atIndex:(unsigned int)a6
{
  _BOOL4 v6;
  __int16 v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  EDBuildablePtg *mTree;
  unsigned int v12;
  EDBuildablePtg *v13;
  uint64_t v14;
  char *LastExtendedData;
  BOOL v16;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  if (a5)
    v9 = 57;
  else
    v9 = 35;
  if (a5)
    v10 = 6;
  else
    v10 = 4;
  if (a6)
  {
    mTree = self->mTree;
    v12 = a6 - 1;
    if (a6 != 1)
    {
      while (mTree)
      {
        mTree = EDBuildablePtg::sibling(mTree);
        if (!--v12)
          goto LABEL_11;
      }
      return 0;
    }
LABEL_11:
    if (!mTree)
      return 0;
    v13 = EDBuildablePtg::sibling(mTree);
    EDBuildablePtg::setSibling(mTree, 0);
    v14 = operator new();
    EDBuildablePtg::EDBuildablePtg(v14, v9, v10);
    EDBuildablePtg::setSibling((EDBuildablePtg *)v14, v13);
    EDBuildablePtg::setSibling(mTree, (EDBuildablePtg *)v14);
    LastExtendedData = XlPtg::getLastExtendedData((XlPtg *)(v14 + 8));
    if (!LastExtendedData)
      return 0;
  }
  else
  {
    LastExtendedData = -[EDBuildableFormula addToken:extendedDataLength:](self, "addToken:extendedDataLength:", v9, v10);
    if (!LastExtendedData)
      return 0;
  }
  if (v6)
  {
    *(_WORD *)LastExtendedData = v7;
    *((_WORD *)LastExtendedData + 1) = v8;
    v16 = 1;
    *((_WORD *)LastExtendedData + 2) = 0;
  }
  else
  {
    *(_DWORD *)LastExtendedData = v8;
    return 1;
  }
  return v16;
}

- (BOOL)insertName:(unint64_t)a3 atIndex:(unsigned int)a4
{
  return -[EDBuildableFormula insertName:link:external:atIndex:](self, "insertName:link:external:atIndex:", a3, -1, 0, *(_QWORD *)&a4);
}

- (BOOL)insertExternalName:(unint64_t)a3 withLink:(unint64_t)a4 atIndex:(unsigned int)a5
{
  return -[EDBuildableFormula insertName:link:external:atIndex:](self, "insertName:link:external:atIndex:", a3, a4, 1, *(_QWORD *)&a5);
}

- (char)setExtendedDataForLastTokenAtIndex:(unsigned int)a3 length:(unsigned int)a4
{
  return 0;
}

- (BOOL)addArrayWithCol:(int)a3 andRow:(int)a4
{
  uint64_t v7;
  EDBuildablePtg *mTree;
  void *v9;

  v7 = (a3 + 1 + (a3 + 1) * a4);
  -[EDBuildableFormula addToken:extendedDataLength:numArgs:](self, "addToken:extendedDataLength:numArgs:", 64, 0, v7);
  mTree = self->mTree;
  if (!mTree)
    return 0;
  if (!v9)
    return 0;
  EDBuildableArrayPtg::setColRow((uint64_t)v9, a3, a4);
  return -[EDBuildableFormula makeArrayForLastToken:](self, "makeArrayForLastToken:", v7);
}

- (BOOL)isConstantList:(unsigned int)a3
{
  BOOL v3;
  EDBuildablePtg *mTree;
  uint64_t v5;

  v3 = 0;
  if (a3)
  {
    mTree = self->mTree;
    if (mTree)
    {
      LODWORD(v5) = a3;
      if (EDBuildablePtg::isConstant(self->mTree))
      {
        v5 = v5;
        do
        {
          v3 = --v5 == 0;
          if (!v5)
            break;
          if (!EDBuildablePtg::sibling(mTree))
            break;
          mTree = EDBuildablePtg::sibling(mTree);
        }
        while (EDBuildablePtg::isConstant(mTree));
      }
      else
      {
        return 0;
      }
    }
  }
  return v3;
}

- (BOOL)convertToList:(unsigned int)a3
{
  return -[EDBuildableFormula convertToList:withFinalParen:](self, "convertToList:withFinalParen:", *(_QWORD *)&a3, 1);
}

- (BOOL)convertToList:(unsigned int)a3 withFinalParen:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v8;

  if (!a3)
    return 0;
  v4 = a4;
  v8 = a3;
  EDBuildablePtg::unionize(self->mTree, &v8);
  if (a3 != 1)
    addOperator(self, 16);
  if (v4)
    return addOperator(self, 21);
  else
    return 1;
}

- (BOOL)convertToIntersect:(unsigned int)a3
{
  unint64_t v6;

  v6 = a3;
  EDBuildablePtg::intersect(self->mTree, &v6);
  if (a3 >= 2)
    addOperator(self, 15);
  return 1;
}

- (BOOL)convertLastRefsToArea
{
  EDBuildablePtg *mTree;
  int v4;
  _BOOL4 v5;
  EDBuildablePtg *v6;
  EDBuildablePtg *v7;
  XlPtg *p_var1;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  unsigned __int16 *LastExtendedData;
  unsigned __int16 *v14;
  BOOL v15;
  BOOL v16;
  EDBuildablePtg *v17;
  EDBuildablePtg *v18;
  int v19;
  unsigned __int16 *v20;
  unsigned __int16 *v21;
  unsigned __int16 *v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  unsigned __int16 *v25;
  int v26;
  int v27;
  int v28;
  EDBuildablePtg *v29;
  int v30;
  __int16 v31;
  __int16 v32;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  mTree = self->mTree;
  if (!mTree)
    return 0;
  v4 = isRef((_BOOL8)&mTree->var1);
  v5 = isArea((_BOOL8)&mTree->var1);
  v6 = EDBuildablePtg::sibling(mTree);
  if (!v6)
    return 0;
  v7 = v6;
  p_var1 = (XlPtg *)&v6->var1;
  v9 = isRef((_BOOL8)&v6->var1);
  v10 = isArea((_BOOL8)p_var1);
  if (v4 == v9 && (v11 = v10, ((v5 ^ v10) & 1) == 0) && v9 | v10 && v4 | v5)
  {
    self->mTree = EDBuildablePtg::sibling(v7);
    EDBuildablePtg::setSibling(v7, 0);
    if (v11)
    {
      if (isArea3D((_BOOL8)p_var1))
      {
        v12 = refTypeOf(v7->var2);
        LastExtendedData = (unsigned __int16 *)XlPtg::getLastExtendedData(p_var1);
        v14 = (unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1);
        v15 = addArea3DOperandFromArea3DExtendedData(self, v12, LastExtendedData, v14);
      }
      else
      {
        v22 = (unsigned __int16 *)XlPtg::getLastExtendedData(p_var1);
        v23 = (unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1);
        v15 = addAreaOperandFromAreaExtendedData(self, v22, v23);
      }
    }
    else if (isRef3D((_BOOL8)p_var1))
    {
      v19 = refTypeOf(v7->var2);
      v20 = (unsigned __int16 *)XlPtg::getLastExtendedData(p_var1);
      v21 = (unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1);
      v15 = addArea3DOperandFromRef3DExtendedData(self, v19, v20, v21);
    }
    else
    {
      v24 = (unsigned __int16 *)XlPtg::getLastExtendedData(p_var1);
      v25 = (unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1);
      v15 = addAreaOperandFromRefExtendedData(self, v24, v25);
    }
    v16 = v15;
    if (EDBuildablePtg::isSpanningRef(mTree))
    {
      v26 = EDBuildablePtg::spanningRef(mTree);
      if (v26 == EDBuildablePtg::spanningRef(v7))
      {
        v27 = EDBuildablePtg::minSpan(mTree);
        if (v27 == EDBuildablePtg::minSpan(v7))
        {
          v28 = EDBuildablePtg::maxSpan(mTree);
          if (v28 == EDBuildablePtg::maxSpan(v7))
          {
            v29 = self->mTree;
            v30 = EDBuildablePtg::spanningRef(mTree);
            v31 = EDBuildablePtg::minSpan(mTree);
            v32 = EDBuildablePtg::maxSpan(mTree);
            EDBuildablePtg::setIsSpanningRef((uint64_t)v29, v30, v31, v32);
          }
        }
      }
    }
    (*((void (**)(EDBuildablePtg *))mTree->var0 + 1))(mTree);
  }
  else
  {
    v34[0] = 0;
    -[EDBuildableFormula convertRefs:toTypes:](self, "convertRefs:toTypes:", 2, v34);
    v17 = EDBuildablePtg::sibling(v7);
    EDBuildablePtg::setSibling(v7, 0);
    v18 = (EDBuildablePtg *)operator new();
    EDBuildablePtg::EDBuildablePtg((uint64_t)v18, 17);
    self->mTree = v18;
    EDBuildablePtg::setSibling(v18, v17);
    EDBuildablePtg::setChild(self->mTree, mTree);
    return 1;
  }
  return v16;
}

- (void)convertRefsInList:(EDBuildablePtg *)a3 toType:(int)a4
{
  uint64_t v4;
  uint64_t Segments;
  EDBuildablePtg *v7;
  char v8;
  uint64_t var2;
  char v10;

  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    Segments = EshGeometryProperties::getSegments((EshGeometryProperties *)a3);
    if (Segments)
    {
      v7 = (EDBuildablePtg *)Segments;
      v8 = 1;
      do
      {
        var2 = v7->var2;
        if ((_DWORD)var2 == 16)
          -[EDBuildableFormula convertRefsInList:toType:](self, "convertRefsInList:toType:", v7, v4);
        else
          v7->var2 = convertValueReference(var2, v4);
        v7 = EDBuildablePtg::sibling(v7);
        v10 = (v7 != 0) & v8;
        v8 = 0;
      }
      while ((v10 & 1) != 0);
    }
  }
}

- (BOOL)convertRefs:(unsigned int)a3 toType:(int)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  if (!a3)
    return 1;
  v5 = *(_QWORD *)&a3;
  v7 = 4 * a3;
  v8 = operator new[]();
  v9 = v8;
  v10 = 0;
  do
  {
    *(_DWORD *)(v8 + v10) = a4;
    v10 += 4;
  }
  while (v7 != v10);
  v11 = -[EDBuildableFormula convertRefs:toTypes:](self, "convertRefs:toTypes:", v5, v8);
  MEMORY[0x22E2DD3F0](v9, 0x1000C8052888210);
  return v11;
}

- (BOOL)convertRefs:(unsigned int)a3 toTypes:(int *)a4
{
  EDBuildablePtg *mTree;
  unsigned int v7;
  uint64_t var2;

  if (!a3)
    return 1;
  mTree = self->mTree;
  if (!mTree)
    return 0;
  v7 = a3;
  do
  {
    var2 = mTree->var2;
    if ((_DWORD)var2 == 21)
    {
      -[EDBuildableFormula convertRefsInList:toType:](self, "convertRefsInList:toType:", mTree, a4[v7 - 1]);
    }
    else
    {
      mTree->var2 = convertValueReference(var2, a4[v7 - 1]);
      mTree = EDBuildablePtg::sibling(mTree);
      if (!mTree)
        return 1;
    }
    --v7;
  }
  while (v7);
  return 1;
}

- (id)lastTokenRefOrArea3dLinkRefIsValid:(BOOL *)a3 withEDLinks:(id)a4
{
  id v6;
  EDBuildablePtg *mTree;
  void *v8;
  int var2;
  char v10;
  unsigned int v11;
  BOOL v12;

  v6 = a4;
  mTree = self->mTree;
  if (mTree)
  {
    v8 = 0;
    var2 = mTree->var2;
    v10 = var2 - 22;
    if ((var2 - 22) <= 0x2F)
    {
      if (((1 << v10) & 0xC0000000C001) != 0)
        goto LABEL_9;
      if (((1 << v10) & 0x3000000000) != 0)
        goto LABEL_7;
    }
    v11 = var2 - 90;
    if (v11 > 0x21)
      goto LABEL_14;
    if (((1 << v11) & 0x300000003) != 0)
    {
LABEL_7:
      objc_msgSend(v6, "referenceAtIndex:", *(unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (((1 << v11) & 0xC00) == 0)
    {
LABEL_14:
      v8 = 0;
      if (!a3)
        goto LABEL_12;
      v12 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_9:
  if (a3)
  {
    v12 = 1;
LABEL_11:
    *a3 = v12;
  }
LABEL_12:

  return v8;
}

- (void)markLastTokenAsDuration
{
  EDBuildablePtg *mTree;

  mTree = self->mTree;
  if (mTree)
    EDBuildablePtg::setIsDuration(mTree, 1);
}

- (void)markLastTokenAsSpanningRefVertically:(BOOL)a3 withMin:(unsigned __int16)a4 andMax:(unsigned __int16)a5
{
  EDBuildablePtg *mTree;
  int v6;

  mTree = self->mTree;
  if (mTree)
  {
    if (a3)
      v6 = 1;
    else
      v6 = 2;
    EDBuildablePtg::setIsSpanningRef((uint64_t)mTree, v6, a4, a5);
  }
}

- (BOOL)uppercaseArgAtIndex:(unsigned int)a3
{
  EDBuildablePtg *v5;
  EDBuildablePtg *v6;
  char *LastExtendedData;
  uint64_t v9;
  EDBuildablePtg *v10;

  if (!self->mTree)
    return 0;
  v5 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a3);
  if (v5)
  {
    v6 = v5;
    if (v5->var2 == 65)
    {
      LastExtendedData = XlPtg::getLastExtendedData((XlPtg *)&v5->var1);
      if (LastExtendedData)
      {
        if (*(_WORD *)LastExtendedData == 113)
          return 0;
      }
    }
    v9 = operator new();
    EDBuildablePtg::EDBuildablePtg(v9, 65, 2);
    *(_WORD *)XlPtg::getLastExtendedData((XlPtg *)(v9 + 8)) = 113;
    v10 = EDBuildablePtg::sibling(v6);
    EDBuildablePtg::setSibling(v6, 0);
    EDBuildablePtg::setChild((EDBuildablePtg *)v9, v6);
    EDBuildablePtg::setSibling((EDBuildablePtg *)v9, v10);
    if (a3)
      EDBuildablePtg::setSibling(-[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a3 - 1), (EDBuildablePtg *)v9);
    else
      self->mTree = (EDBuildablePtg *)v9;
  }
  return 1;
}

- (BOOL)shrinkSpanningRefAtArgIndex:(unsigned int)a3
{
  EDBuildablePtg *v4;

  v4 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a3);
  if (v4)
    LOBYTE(v4) = -[EDBuildableFormula shrinkSpanningRef:](self, "shrinkSpanningRef:", v4);
  return (char)v4;
}

- (BOOL)wrapArgumentsWithOperator:(int)a3 argumentCount:(unsigned int)a4 atIndex:(unsigned int)a5
{
  BOOL v6;
  EDBuildablePtg *v10;
  EDBuildablePtg *v11;
  BOOL v12;
  EDBuildablePtg *v13;
  EDBuildablePtg *v14;
  EDBuildablePtg *v15;
  EDBuildablePtg *v17;

  if (a4 - 1 >= a5 + 1 || self->mTree == 0)
    return 0;
  v17 = 0;
  v10 = -[EDBuildableFormula tokenAtIndex:previousToken:](self, "tokenAtIndex:previousToken:", a5 - a4 + 1, &v17);
  v11 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a5);
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  v6 = !v12;
  if (!v12)
  {
    v13 = v11;
    v14 = (EDBuildablePtg *)operator new();
    EDBuildablePtg::EDBuildablePtg((uint64_t)v14, a3);
    EDBuildablePtg::setChild(v14, v10);
    if (v17)
      EDBuildablePtg::setSibling(v17, v14);
    else
      self->mTree = v14;
    v15 = EDBuildablePtg::sibling(v13);
    EDBuildablePtg::setSibling(v13, 0);
    EDBuildablePtg::setSibling(v14, v15);
  }
  return v6;
}

- (BOOL)addInfixOperator:(int)a3 atIndex:(unsigned int)a4 factor:(double)a5
{
  unsigned int v6;
  uint64_t v9;
  EDBuildablePtg *LastExtendedData;
  EDBuildablePtg *v12;
  uint64_t v13;
  EDBuildablePtg *v15;

  v6 = a3 - 5;
  if ((a3 - 5) <= 1 && a5 == 1.0)
    goto LABEL_8;
  v9 = *(_QWORD *)&a3;
  v15 = 0;
  LastExtendedData = -[EDBuildableFormula tokenAtIndex:previousToken:](self, "tokenAtIndex:previousToken:", a4, &v15);
  if (LastExtendedData)
  {
    v12 = LastExtendedData;
    if (v6 <= 1 && LastExtendedData->var2 == 22)
    {
LABEL_8:
      LOBYTE(LastExtendedData) = 1;
      return (char)LastExtendedData;
    }
    v13 = operator new();
    EDBuildablePtg::EDBuildablePtg(v13, 31, 8);
    LastExtendedData = (EDBuildablePtg *)XlPtg::getLastExtendedData((XlPtg *)(v13 + 8));
    if (LastExtendedData)
    {
      *(double *)XlPtg::getLastExtendedData((XlPtg *)(v13 + 8)) = a5;
      if (v15)
        EDBuildablePtg::setSibling(v15, (EDBuildablePtg *)v13);
      else
        self->mTree = (EDBuildablePtg *)v13;
      EDBuildablePtg::setSibling((EDBuildablePtg *)v13, v12);
      LOBYTE(LastExtendedData) = -[EDBuildableFormula wrapArgumentsWithOperator:argumentCount:atIndex:](self, "wrapArgumentsWithOperator:argumentCount:atIndex:", v9, 2, a4 + 1);
    }
  }
  return (char)LastExtendedData;
}

- (BOOL)fixTableOfConstantsRefs
{
  return self->mTree && -[EDBuildableFormula fixTableOfConstantsRef:](self, "fixTableOfConstantsRef:");
}

- (void)setWarning:(int)a3
{
  self->mWarning = a3;
}

- (int)warningType
{
  return self->mWarning;
}

- (BOOL)isSupportedFormula
{
  return self->mWarning == 0;
}

- (id)formula
{
  EDFormula *v3;
  EDBuildablePtg *mTree;

  +[EDFormula formula](EDFormula, "formula");
  v3 = (EDFormula *)objc_claimAutoreleasedReturnValue();
  mTree = self->mTree;
  if (mTree)
    EDBuildablePtg::addToEDFormula(mTree, v3);
  return v3;
}

- (void)copyToFormula:(id)a3
{
  EDFormula *v4;
  EDBuildablePtg *mTree;
  EDFormula *v6;

  v4 = (EDFormula *)a3;
  v6 = v4;
  if (self->mWarning)
  {
    -[EDFormula setWarning:](v4, "setWarning:");
  }
  else
  {
    mTree = self->mTree;
    if (mTree)
      EDBuildablePtg::addToEDFormula(mTree, v6);
  }

}

- (BOOL)copyToken:(unsigned int)a3 from:(id)a4
{
  id v6;
  EDBuildablePtg *v7;
  BOOL v8;

  v6 = a4;
  if (!v6)
    goto LABEL_5;
  v7 = (EDBuildablePtg *)operator new();
  EDBuildablePtg::EDBuildablePtg(v7, (const EDBuildablePtg *)objc_msgSend(v6, "tokenAtIndex:", a3));
  if (!v7->var2)
  {
    (*((void (**)(EDBuildablePtg *))v7->var0 + 1))(v7);
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  EDBuildablePtg::resetSibling(v7);
  EDBuildablePtg::resetPreviousSibling(v7);
  EDBuildablePtg::resetParent(v7);
  EDBuildablePtg::setSibling(v7, self->mTree);
  self->mTree = v7;
  v8 = 1;
LABEL_6:

  return v8;
}

- (BOOL)argTokenIsDurationAtIndex:(unsigned int)a3
{
  EDBuildablePtg *v3;

  v3 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a3);
  if (v3)
    LOBYTE(v3) = EDBuildablePtg::isDuration(v3);
  return (char)v3;
}

- (int)argTokenTypeAtIndex:(unsigned int)a3
{
  EDBuildablePtg *v3;

  v3 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a3);
  if (v3)
    LODWORD(v3) = v3->var2;
  return (int)v3;
}

- (BOOL)replaceArgPtgAtIndex:(unsigned int)a3 withFormula:(id)a4
{
  EDBuildablePtg **v6;
  BOOL v7;
  EDBuildablePtg *mTree;
  unsigned int v10;
  EDBuildablePtg *v11;
  EDBuildablePtg *v12;
  EDBuildablePtg *v13;

  v6 = (EDBuildablePtg **)a4;
  if (EDBuildablePtg::sibling(v6[1]))
    goto LABEL_2;
  mTree = self->mTree;
  if (a3 && mTree)
  {
    v10 = 0;
    do
    {
      v11 = mTree;
      v12 = EDBuildablePtg::sibling(mTree);
      mTree = v12;
      ++v10;
    }
    while (v10 < a3 && v12);
    if (a3 != v10)
      goto LABEL_2;
    EDBuildablePtg::setSibling(v11, v6[1]);
    if (!mTree)
    {
LABEL_15:
      v6[1] = 0;
      v7 = 1;
      goto LABEL_3;
    }
LABEL_14:
    v13 = EDBuildablePtg::sibling(mTree);
    EDBuildablePtg::setSibling(mTree, 0);
    EDBuildablePtg::setSibling(v6[1], v13);
    (*((void (**)(EDBuildablePtg *))mTree->var0 + 1))(mTree);
    goto LABEL_15;
  }
  if (!a3)
  {
    self->mTree = v6[1];
    if (!mTree)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_2:
  v7 = 0;
LABEL_3:

  return v7;
}

- (BOOL)insertVariableFunction:(unsigned __int16)a3 afterIndex:(unsigned int)a4 numArgs:(unsigned int)a5
{
  EDBuildablePtg *v7;
  EDBuildablePtg *v8;
  uint64_t v9;
  char *LastExtendedData;
  unsigned int v11;
  EDBuildablePtg *v12;
  EDBuildablePtg *v13;
  EDBuildablePtg *v14;

  v7 = -[EDBuildableFormula tokenAtIndex:](self, "tokenAtIndex:", a4);
  v8 = EDBuildablePtg::sibling(v7);
  v9 = operator new();
  EDBuildablePtg::EDBuildablePtg(v9, 66, 8);
  LastExtendedData = XlPtg::getLastExtendedData((XlPtg *)(v9 + 8));
  *(_WORD *)LastExtendedData = a5;
  *((_WORD *)LastExtendedData + 1) = 0;
  *((_WORD *)LastExtendedData + 2) = a3;
  *((_WORD *)LastExtendedData + 3) = 0;
  EDBuildablePtg::setSibling(v7, (EDBuildablePtg *)v9);
  if (a5)
  {
    EDBuildablePtg::setChild((EDBuildablePtg *)v9, v8);
    if (v8)
    {
      v11 = 1;
      v12 = v8;
      do
      {
        v13 = v12;
        v14 = EDBuildablePtg::sibling(v12);
        v12 = v14;
        if (v11 >= a5)
          break;
        ++v11;
      }
      while (v14);
      if (v14 != v8)
      {
        EDBuildablePtg::setSibling(v13, 0);
        EDBuildablePtg::setSibling((EDBuildablePtg *)v9, v12);
      }
    }
  }
  return 1;
}

- (unsigned)removeOptionalPtgArgs:(unsigned int)a3 minArgs:(unsigned int)a4
{
  unsigned int result;
  unsigned int v7;
  unsigned int v8;
  EDBuildablePtg *mTree;

  result = 0;
  if (a3)
  {
    v7 = a3 - a4;
    if (a3 >= a4)
    {
      v8 = 0;
      if (a3 != a4)
      {
        while (1)
        {
          mTree = self->mTree;
          if (!mTree || mTree->var2 != 22)
            break;
          self->mTree = EDBuildablePtg::sibling(self->mTree);
          EDBuildablePtg::setSibling(mTree, 0);
          (*((void (**)(EDBuildablePtg *))mTree->var0 + 1))(mTree);
          if (v7 == ++v8)
          {
            v8 = v7;
            return a3 - v8;
          }
        }
      }
      return a3 - v8;
    }
  }
  return result;
}

- (EDBuildablePtg)tokenAtIndex:(unint64_t)a3
{
  uint64_t v4;

  v4 = 0;
  return -[EDBuildableFormula tokenAtIndex:previousToken:](self, "tokenAtIndex:previousToken:", a3, &v4);
}

- (EDBuildablePtg)tokenAtIndex:(unint64_t)a3 previousToken:(EDBuildablePtg *)a4
{
  EDBuildablePtg *v5;
  EDBuildablePtg *result;
  unint64_t v8;

  v5 = 0;
  result = self->mTree;
  if (a3 && result)
  {
    v8 = 1;
    do
    {
      v5 = result;
      result = EDBuildablePtg::sibling(result);
      if (v8 >= a3)
        break;
      ++v8;
    }
    while (result);
  }
  *a4 = v5;
  return result;
}

- (BOOL)fixTableOfConstantsRef:(EDBuildablePtg *)a3
{
  int v5;
  char *LastExtendedData;
  BOOL v7;

  if (!a3)
    return a3 != 0;
  if (isArea((_BOOL8)&a3->var1)
    && EDBuildablePtg::isSpanningRef(a3)
    && (v5 = EDBuildablePtg::minSpan(a3), v5 == EDBuildablePtg::maxSpan(a3)))
  {
    -[EDBuildableFormula shrinkSpanningRef:](self, "shrinkSpanningRef:", a3);
  }
  else if (a3->var2 == 66)
  {
    LastExtendedData = XlPtg::getLastExtendedData((XlPtg *)&a3->var1);
    if (LastExtendedData)
    {
      v7 = *((unsigned __int16 *)LastExtendedData + 2) - 101 < 2;
      goto LABEL_10;
    }
  }
  v7 = 0;
LABEL_10:
  if (EshGeometryProperties::getSegments((EshGeometryProperties *)a3) && !v7)
    -[EDBuildableFormula fixTableOfConstantsRef:](self, "fixTableOfConstantsRef:", EshGeometryProperties::getSegments((EshGeometryProperties *)a3));
  if (EDBuildablePtg::sibling(a3))
    -[EDBuildableFormula fixTableOfConstantsRef:](self, "fixTableOfConstantsRef:", EDBuildablePtg::sibling(a3));
  return a3 != 0;
}

- (BOOL)shrinkSpanningRef:(EDBuildablePtg *)a3
{
  XlPtg *p_var1;
  char *LastExtendedData;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  unsigned int v9;
  __int16 v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  __int16 v14;
  uint64_t v15;

  if (a3)
  {
    p_var1 = (XlPtg *)&a3->var1;
    if (isArea((_BOOL8)&a3->var1) && EDBuildablePtg::isSpanningRef(a3))
    {
      LastExtendedData = XlPtg::getLastExtendedData(p_var1);
      v6 = EDBuildablePtg::spanningRef(a3);
      v7 = isArea3D((_BOOL8)p_var1);
      v8 = v7;
      if (v6 == 2)
      {
        if (v7)
          v9 = 3;
        else
          v9 = 2;
        v10 = *(_WORD *)&LastExtendedData[2 * v9] & 0xC000;
        v11 = EDBuildablePtg::minSpan(a3) | v10;
        v12 = v9 + 1;
        *(_WORD *)&LastExtendedData[2 * v9] = v11;
        v13 = *(_WORD *)&LastExtendedData[2 * v9 + 2] & 0xC000;
        *(_WORD *)&LastExtendedData[2 * v12] = EDBuildablePtg::maxSpan(a3) | v13;
      }
      else
      {
        *(_WORD *)&LastExtendedData[2 * v7] = EDBuildablePtg::minSpan(a3);
        v14 = EDBuildablePtg::maxSpan(a3);
        v15 = 2;
        if (v8)
          v15 = 4;
        *(_WORD *)&LastExtendedData[v15] = v14;
      }
    }
  }
  return 1;
}

@end
