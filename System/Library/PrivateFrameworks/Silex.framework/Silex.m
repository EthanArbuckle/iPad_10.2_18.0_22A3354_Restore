id SXJSONObjectObjectValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  objc_class *v9;
  const char *Name;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sel_getName((SEL)a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXJSONObject objectForLookupKey:]((id *)&v3->super.isa, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SXJSONObjectRuntimeValue(v3, (NSString *)v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v8 = (id)objc_claimAutoreleasedReturnValue(),
          v8,
          v6 == v8))
    {
      v7 = 0;
      goto LABEL_18;
    }
    +[SXJSONObject lock](SXJSONObject, "lock");
    v9 = (objc_class *)objc_opt_class();
    Name = sel_getName((SEL)a2);
    SXJSONObjectRuntimeGenerateLookupKey(v9, Name);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SXJSONObject propertyHashTable](SXJSONObject, "propertyHashTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)(id)objc_msgSend(v12, "objectForKey:", v11);

    +[SXJSONObject protocolPropertyDefinitions](SXJSONObject, "protocolPropertyDefinitions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[SXJSONObject unlock](SXJSONObject, "unlock");
    if (v15)
      v13 = (objc_class *)objc_msgSend((id)objc_opt_class(), "classForProtocolProperty:withValue:", v4, v6);
    if (v13 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v13 == (objc_class *)objc_opt_class() || v13 == (objc_class *)objc_opt_class())
      {
        objc_msgSend((id)objc_opt_class(), "objectValueClassBlockForPropertyWithName:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "valueClassBlockForPropertyWithName:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "purgeClassBlockForPropertyWithName:", v4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (id)objc_msgSend([v13 alloc], "initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:", v17, v16, v18, v6, v3->_specificationVersion);

      }
      else
      {
        v7 = (id)objc_msgSend([v13 alloc], "initWithJSONObject:andVersion:", v6, v3->_specificationVersion);
        if (!v7)
          goto LABEL_17;
      }
      -[SXJSONObject storeObject:forLookupKey:](v3, "storeObject:forLookupKey:", v7, v4);
    }
    else
    {
      -[SXJSONObject storeObject:forLookupKey:](v3, "storeObject:forLookupKey:", v6, v4);
      v7 = v6;
    }
LABEL_17:

    goto LABEL_18;
  }
  v6 = v5;
  v7 = v6;
LABEL_18:

  return v7;
}

void sub_2170266A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_2170267A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id SXJSONObjectRuntimeValue(SXJSONObject *a1, NSString *a2)
{
  SXJSONObject *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  objc_msgSend((id)objc_opt_class(), "jsonPropertyNameForObjCPropertyName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKey:](v3->_jsonDictionary, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_21702682C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_217026D68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_217026E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void SXJSONObjectRuntimeGenerateAccessorsForClass(objc_class *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  objc_property *v6;
  const char *v7;
  const char *Attributes;
  objc_property_attribute_t *v9;
  BOOL v10;
  objc_class *Superclass;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  objc_property *v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  Class Class;
  Class v26;
  Class v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *cls;
  void (*v34)(void);
  char *v35;
  char *name;
  unsigned int outCount[2];
  objc_property **v38;

  v38 = 0;
  v2 = SXJSONObjectRuntimeCopyClassAndProtocolProperties(a1, &v38, 0, 1);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = v38[v4];
      v7 = property_getName(v6);
      Attributes = property_getAttributes(v6);
      outCount[0] = 0;
      v9 = property_copyAttributeList(v6, outCount);
      SXJSONObjectRuntimeGenerateAccessorsForClass(a1, v7, v9, outCount[0], Attributes);
      free(v9);
      v4 = v5;
      v10 = v3 > v5++;
    }
    while (v10);
  }
  if (v38)
  {
    free(v38);
    v38 = 0;
  }
  if (a1)
  {
    Superclass = a1;
    do
    {
      if (Superclass == (objc_class *)objc_opt_class()
        || Superclass == (objc_class *)objc_opt_class()
        || Superclass == (objc_class *)objc_opt_class()
        || Superclass == (objc_class *)objc_opt_class())
      {
        break;
      }
      *(_QWORD *)outCount = 0;
      cls = Superclass;
      v12 = SXJSONObjectRuntimeCopyClassAndProtocolProperties(Superclass, (objc_property ***)outCount, 0, 1);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = 1;
        do
        {
          v16 = *(objc_property **)(*(_QWORD *)outCount + 8 * v14);
          v17 = property_getName(v16);
          v18 = property_getAttributes(v16);
          SXJSONObjectRuntimeGenerateLookupKey(a1, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[SXJSONObject lock](SXJSONObject, "lock", cls);
          +[SXJSONObject propertyDefinitions](SXJSONObject, "propertyDefinitions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v19);
          v21 = objc_claimAutoreleasedReturnValue();

          +[SXJSONObject protocolPropertyDefinitions](SXJSONObject, "protocolPropertyDefinitions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v19);
          v23 = objc_claimAutoreleasedReturnValue();

          +[SXJSONObject unlock](SXJSONObject, "unlock");
          if (!(v21 | v23))
          {
            v35 = 0;
            name = 0;
            v34 = 0;
            SXJSONObjectDetermineFunctionSpecificationAndCopyClassName(v18, (const char **)&v35, &v34, &name);
            v24 = name;
            Class = objc_getClass(name);
            v26 = objc_getClass("SXJSONDictionary");
            v27 = objc_getClass("SXJSONArray");
            v28 = sel_registerName("initWithJSONObject:andVersion:");
            if ((-[objc_class isSubclassOfClass:](Class, "isSubclassOfClass:", v26) & 1) != 0
              || (-[objc_class isSubclassOfClass:](Class, "isSubclassOfClass:", v27) & 1) != 0
              || class_respondsToSelector(Class, v28))
            {
              +[SXJSONObject lock](SXJSONObject, "lock");
              +[SXJSONObject propertyHashTable](SXJSONObject, "propertyHashTable");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKey:", Class, v19);

              +[SXJSONObject unlock](SXJSONObject, "unlock");
            }
            if (Class)
            {
              +[SXJSONObject lock](SXJSONObject, "lock");
              +[SXJSONObject propertyDefinitions](SXJSONObject, "propertyDefinitions");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKey:", Class, v19);

              +[SXJSONObject unlock](SXJSONObject, "unlock");
            }
            else if (v24)
            {
              SXJSONObjectProtocolFromClassName(v24);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                +[SXJSONObject lock](SXJSONObject, "lock");
                +[SXJSONObject protocolPropertyDefinitions](SXJSONObject, "protocolPropertyDefinitions");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setObject:forKey:", v31, v19);

                +[SXJSONObject unlock](SXJSONObject, "unlock");
              }

            }
            free(v24);
          }

          v14 = v15;
          v10 = v13 > v15++;
        }
        while (v10);
      }
      free(*(void **)outCount);
      Superclass = class_getSuperclass(cls);
    }
    while (Superclass);
  }
}

void sub_21702747C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id SXJSONObjectRuntimeGenerateLookupKey(objc_class *a1, const char *a2)
{
  const char *Name;
  size_t v4;
  size_t v5;
  char *v6;
  void *v7;

  Name = class_getName(a1);
  v4 = strlen(Name);
  v5 = strlen(a2);
  v6 = (char *)malloc_type_malloc(v5 + v4 + 2, 0x100004077774924uLL);
  memcpy(v6, Name, v4);
  v6[v4] = 59;
  memcpy(&v6[v4 + 1], a2, v5);
  v6[v5 + 1 + v4] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  free(v6);
  return v7;
}

uint64_t SXJSONObjectPrimitivesMatchPrimitiveForEncodingAndRetrieveInformation(const char *a1, const char **a2, const char **a3, void (**a4)(void))
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  char *v11;

  if (dword_253DDCEFC < 1)
    return 0;
  v8 = 0;
  v9 = 0;
  while (1)
  {
    v10 = SXJSONObjectWrapEncodeIntoPropertyDefinition(*(const char **)(_primitives + v8 + 8));
    v11 = (char *)v10;
    if (*(unsigned __int8 *)v10 == *(unsigned __int8 *)a1 && !strcmp(v10, a1))
      break;
    free(v11);
    ++v9;
    v8 += 32;
    if (v9 >= dword_253DDCEFC)
      return 0;
  }
  if (a2)
    *a2 = *(const char **)(_primitives + v8);
  if (a3)
    *a3 = *(const char **)(_primitives + v8 + 16);
  if (a4)
    *a4 = *(void (**)(void))(_primitives + v8 + 24);
  free(v11);
  return 1;
}

_BYTE *SXJSONObjectWrapEncodeIntoPropertyDefinition(const char *a1)
{
  const char *v1;
  size_t v2;
  _BYTE *result;
  _BYTE *v4;
  size_t v5;
  char v6;

  v1 = a1;
  v2 = strlen(a1);
  result = malloc_type_malloc(v2 + 8, 0x100004077774924uLL);
  *result = 84;
  if (v2)
  {
    v4 = result + 1;
    v5 = v2;
    do
    {
      v6 = *v1++;
      *v4++ = v6;
      --v5;
    }
    while (v5);
  }
  strcpy(&result[v2 + 1], ",R,D,N");
  return result;
}

uint64_t SXJSONObjectDetermineFunctionSpecificationAndCopyClassName(const char *a1, const char **a2, void (**a3)(void), char **a4)
{
  uint64_t result;
  const char *v9;
  void (*v10)(void);
  size_t v11;
  uint64_t v12;
  int v13;
  size_t v14;
  uint64_t v15;
  char *v16;
  id v17;

  result = SXJSONObjectPrimitivesMatchPrimitiveForEncodingAndRetrieveInformation(a1, 0, a2, a3);
  if ((result & 1) == 0)
  {
    result = SXJSONObjectPartialCompare(a1, "Tf");
    if ((result & 1) != 0 || (result = SXJSONObjectPartialCompare(a1, "Td"), (result & 1) != 0))
    {
      v9 = "d@:";
      v10 = (void (*)(void))SXJSONObjectFloatValue;
LABEL_9:
      *a3 = v10;
      *a2 = v9;
      return result;
    }
    result = SXJSONObjectPartialCompare(a1, "Ti");
    if ((result & 1) != 0 || (result = SXJSONObjectPartialCompare(a1, "Tl"), (result & 1) != 0))
    {
      v9 = "l@:";
LABEL_8:
      v10 = (void (*)(void))SXJSONObjectIntegerValue;
      goto LABEL_9;
    }
    result = SXJSONObjectPartialCompare(a1, "Tq");
    if ((result & 1) != 0)
    {
      v9 = "q@:";
      goto LABEL_8;
    }
    result = SXJSONObjectPartialCompare(a1, "TI");
    if ((result & 1) != 0 || (result = SXJSONObjectPartialCompare(a1, "TL"), (result & 1) != 0))
    {
      v9 = "L@:";
LABEL_16:
      v10 = (void (*)(void))SXJSONObjectUnsignedIntegerValue;
      goto LABEL_9;
    }
    result = SXJSONObjectPartialCompare(a1, "TQ");
    if ((result & 1) != 0)
    {
      v9 = "Q@:";
      goto LABEL_16;
    }
    result = SXJSONObjectPartialCompare(a1, "Tc");
    if ((result & 1) != 0)
    {
      v9 = "c@:";
LABEL_23:
      v10 = (void (*)(void))SXJSONObjectBoolValue;
      goto LABEL_9;
    }
    result = SXJSONObjectPartialCompare(a1, "TB");
    if ((result & 1) != 0)
    {
      v9 = "B@:";
      goto LABEL_23;
    }
    if (*a1 == 84 && a1[1] == 64)
    {
      v11 = strlen(a1);
      v12 = 0;
      do
        v13 = a1[v12++];
      while (v13 != 44);
      if ((_DWORD)v12 == 3 || v11 < v11 - v12 + 5)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("InvalidPropertyDefinition"), CFSTR("Type 'id' is not supported in SXJSONObject"), 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v17);
      }
      v14 = v12 - 5;
      v15 = v12;
      v16 = (char *)malloc_type_malloc(v12 - 4, 0x100004077774924uLL);
      result = (uint64_t)memcpy(v16, a1 + 3, v14);
      v16[v15 - 5] = 0;
      *a4 = v16;
      v9 = "@@:";
      v10 = (void (*)(void))SXJSONObjectObjectValue;
      goto LABEL_9;
    }
  }
  return result;
}

BOOL SXJSONObjectPartialCompare(const char *a1, const char *a2)
{
  const char *v3;
  size_t v4;
  size_t v5;
  _BOOL8 result;
  size_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  BOOL v13;

  v3 = a1;
  v4 = strlen(a1);
  v5 = strlen(a2);
  if (v4 < v5)
    return 0;
  if (!v5)
    return 1;
  v7 = v5 - 1;
  do
  {
    v9 = *(unsigned __int8 *)v3++;
    v8 = v9;
    v11 = *(unsigned __int8 *)a2++;
    v10 = v11;
    v13 = v7-- != 0;
    result = v8 == v10;
  }
  while (v8 == v10 && v13);
  return result;
}

char **SXJSONObjectRuntimeGenerateAccessorsForClass(objc_class *a1, const char *a2, objc_property_attribute_t *a3, unsigned int a4, const char *a5)
{
  char **result;
  BOOL v9[2];
  unint64_t v10;

  v10 = 0;
  *(_WORD *)v9 = 0;
  result = SXJSONObjectRuntimeGetPropertyInfo((char **)a3, a4, &v10, &v9[1], v9);
  if (v9[1] && (v10 & 1) != 0)
    return (char **)SXJSONObjectRuntimeAddGetterToClass(a1, a2, a5);
  return result;
}

char **SXJSONObjectRuntimeGetPropertyInfo(char **result, unsigned int a2, unint64_t *a3, BOOL *a4, BOOL *a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  if (a2)
  {
    v5 = a2;
    while (1)
    {
      v6 = **result;
      if (v6 > 77)
        break;
      if (v6 != 38)
      {
        if (v6 == 67)
        {
          if (a3)
          {
            v7 = 8;
            goto LABEL_22;
          }
          goto LABEL_23;
        }
        if (v6 != 68)
          goto LABEL_23;
        if (a4)
          *a4 = 1;
        goto LABEL_14;
      }
      if (a3)
      {
        v7 = 2;
        goto LABEL_22;
      }
LABEL_23:
      result += 2;
      if (!--v5)
        return result;
    }
    if (v6 != 78)
    {
      if (v6 == 82)
      {
        if (a3)
        {
          v7 = 1;
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      if (v6 != 86)
        goto LABEL_23;
    }
    if (a5)
      *a5 = 0;
LABEL_14:
    if (a3)
    {
      v7 = 4;
LABEL_22:
      *a3 |= v7;
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  return result;
}

uint64_t SXJSONObjectRuntimeAddGetterToClass(objc_class *a1, const char *__s, const char *a3)
{
  size_t v6;
  void *v7;
  const char *Uid;
  objc_method *InstanceMethod;
  SEL v10;
  unsigned __int8 *TypeEncoding;
  char *v12;
  void (*v13)(void);
  objc_class *v14;
  const char *v15;
  char *v16;
  void *v17;
  Class Class;
  Class v19;
  const char *v20;
  Class v21;
  void *v22;
  const char *v23;
  uint64_t result;
  const char *Name;
  void *v26;
  void *v27;
  id v28;
  char *v29;
  void (*v30)(void);
  char *v31;

  v6 = strlen(__s);
  v7 = malloc_type_malloc(v6 + 20, 0x100004077774924uLL);
  memcpy(v7, __s, v6);
  strcpy((char *)v7 + v6, "WithValue:withType:");
  Uid = sel_getUid((const char *)v7);
  InstanceMethod = class_getInstanceMethod(a1, Uid);
  free(v7);
  if (InstanceMethod)
  {
    v10 = sel_registerName(__s);
    TypeEncoding = (unsigned __int8 *)method_getTypeEncoding(InstanceMethod);
    v30 = 0;
    v31 = 0;
    SXJSONObjectDetermineCustomFunctionSpecification(TypeEncoding, (const char **)&v31, &v30);
    v12 = v31;
    if (v31)
    {
      v13 = v30;
      if (v30)
      {
        v14 = a1;
        v15 = v10;
        return class_addMethod(v14, v15, v13, v12);
      }
    }
    Name = class_getName(a1);
    return printf("Error adding method, not found an implementation for property '%s' of class %s\n", __s, Name);
  }
  v30 = 0;
  v31 = 0;
  v29 = 0;
  SXJSONObjectDetermineFunctionSpecificationAndCopyClassName(a3, (const char **)&v31, &v30, &v29);
  v16 = v29;
  if (v29)
  {
    SXJSONObjectRuntimeGenerateLookupKey(a1, __s);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    Class = objc_getClass("SXJSONDictionary");
    v19 = objc_getClass("SXJSONArray");
    v20 = sel_registerName("initWithJSONObject:andVersion:");
    v21 = objc_getClass(v16);
    if ((-[objc_class isSubclassOfClass:](v21, "isSubclassOfClass:", Class) & 1) != 0
      || (-[objc_class isSubclassOfClass:](v21, "isSubclassOfClass:", v19) & 1) != 0
      || class_respondsToSelector(v21, v20))
    {
      +[SXJSONObject lock](SXJSONObject, "lock");
      +[SXJSONObject propertyHashTable](SXJSONObject, "propertyHashTable");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v21, v17);
    }
    else
    {
      if (!v21)
      {
        SXJSONObjectProtocolFromClassName(v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          +[SXJSONObject lock](SXJSONObject, "lock");
          +[SXJSONObject protocolPropertyDefinitions](SXJSONObject, "protocolPropertyDefinitions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKey:", v26, v17);

          +[SXJSONObject unlock](SXJSONObject, "unlock");
        }

        goto LABEL_11;
      }
      +[SXJSONObject lock](SXJSONObject, "lock");
      +[SXJSONObject propertyDefinitions](SXJSONObject, "propertyDefinitions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v21, v17);
    }

    +[SXJSONObject unlock](SXJSONObject, "unlock");
LABEL_11:
    free(v16);

  }
  if (!v30 || !v31)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("InvalidPropertyDefinition"), CFSTR("Property definition is not supported"), 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v23 = sel_registerName(__s);
  result = class_respondsToSelector(a1, v23);
  if ((result & 1) == 0)
  {
    v13 = v30;
    v12 = v31;
    v14 = a1;
    v15 = v23;
    return class_addMethod(v14, v15, v13, v12);
  }
  return result;
}

void sub_217027EC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectRuntimeCopyClassAndProtocolProperties(objc_class *Superclass, objc_property ***a2, char a3, int a4)
{
  NSPointerArray *v8;
  objc_property_t *v9;
  objc_property_t *v10;
  unint64_t i;
  _QWORD *v12;
  Protocol **v13;
  Protocol **v14;
  unint64_t j;
  Protocol *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  objc_property **v20;
  unsigned int v22;
  unsigned int outCount;

  v8 = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1748]), "initWithOptions:", 258);
  if (Superclass)
  {
    while (-[objc_class isSubclassOfClass:](Superclass, "isSubclassOfClass:", objc_opt_class()))
    {
      outCount = 0;
      v9 = class_copyPropertyList(Superclass, &outCount);
      v10 = v9;
      if (outCount)
      {
        for (i = 0; i < outCount; ++i)
        {
          v12 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
          *v12 = v10[i];
          -[NSPointerArray addPointer:](v8, "addPointer:", v12);
        }
      }
      else if (!v9)
      {
        goto LABEL_9;
      }
      free(v10);
LABEL_9:
      if (!a4)
        goto LABEL_16;
      v22 = 0;
      v13 = class_copyProtocolList(Superclass, &v22);
      v14 = v13;
      if (v22)
      {
        for (j = 0; j < v22; ++j)
        {
          v16 = v14[j];
          SXJSONObjectRuntimeCollectPropertiesFromProtocol(v16, v8);

        }
      }
      else if (!v13)
      {
        goto LABEL_16;
      }
      free(v14);
LABEL_16:
      if ((a3 & 1) != 0)
      {
        Superclass = class_getSuperclass(Superclass);
        if (Superclass)
          continue;
      }
      break;
    }
  }
  v17 = -[NSPointerArray count](v8, "count");
  v18 = v17;
  if (a2)
  {
    *a2 = (objc_property **)malloc_type_malloc(8 * v17, 0x2004093837F09uLL);
    if (v18)
    {
      for (k = 0; k != v18; ++k)
      {
        v20 = -[NSPointerArray pointerAtIndex:](v8, "pointerAtIndex:", k);
        (*a2)[k] = *v20;
        free(v20);
      }
    }
  }

  return v18;
}

void sub_2170280D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SXJSONObjectRuntimeCollectPropertiesFromProtocol(Protocol *a1, NSPointerArray *a2)
{
  Protocol *v3;
  NSPointerArray *v4;
  objc_property_t *v5;
  objc_property_t *v6;
  unint64_t i;
  _QWORD *v8;
  Protocol **v9;
  Protocol **v10;
  unint64_t j;
  Protocol *v12;
  unsigned int v13;
  unsigned int outCount;

  v3 = a1;
  v4 = a2;
  outCount = 0;
  v5 = protocol_copyPropertyList(v3, &outCount);
  v6 = v5;
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v8 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
      *v8 = v6[i];
      -[NSPointerArray addPointer:](v4, "addPointer:", v8);
    }
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  free(v6);
LABEL_7:
  v13 = 0;
  v9 = protocol_copyProtocolList(v3, &v13);
  v10 = v9;
  if (v13)
  {
    for (j = 0; j < v13; ++j)
    {
      v12 = v10[j];
      SXJSONObjectRuntimeCollectPropertiesFromProtocol(v12, v4);

    }
    goto LABEL_12;
  }
  if (v9)
LABEL_12:
    free(v10);

}

void sub_217028210(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

unsigned __int8 *SXJSONObjectDetermineCustomFunctionSpecification(unsigned __int8 *result, const char **a2, void (**a3)(void))
{
  unsigned int v3;
  unsigned int v4;
  void (*v5)(void);
  const char *v6;

  v3 = *result;
  if (v3 > 0x4B)
  {
    v4 = v3 - 99;
    v5 = (void (*)(void))SXJSONObjectCustomIntegerValue;
    v6 = "l@:";
    switch(v4)
    {
      case 0u:
        v5 = (void (*)(void))SXJSONObjectCustomBoolValue;
        v6 = "c@:";
        goto LABEL_18;
      case 1u:
      case 3u:
        v5 = (void (*)(void))SXJSONObjectCustomFloatValue;
        v6 = "d@:";
        goto LABEL_18;
      case 2u:
      case 4u:
      case 5u:
      case 7u:
      case 8u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
        return result;
      case 6u:
        v6 = "i@:";
        goto LABEL_18;
      case 9u:
        goto LABEL_18;
      case 0xEu:
        v6 = "q@:";
        goto LABEL_18;
      default:
        if (SXJSONObjectCustomIntegerValue == 76)
        {
          v6 = "L@:";
        }
        else
        {
          if (SXJSONObjectCustomIntegerValue != 81)
            return result;
          v6 = "Q@:";
        }
        break;
    }
LABEL_17:
    v5 = (void (*)(void))SXJSONObjectCustomUnsignedIntegerValue;
    goto LABEL_18;
  }
  switch(v3)
  {
    case '@':
      v5 = (void (*)(void))SXJSONObjectCustomObjectValue;
      v6 = "@@:";
      break;
    case 'B':
      v5 = (void (*)(void))SXJSONObjectCustomBoolValue;
      v6 = "B@:";
      break;
    case 'I':
      v6 = "I@:";
      goto LABEL_17;
    default:
      return result;
  }
LABEL_18:
  *a2 = v6;
  *a3 = v5;
  return result;
}

uint64_t SXDefaultComponentStyleIdentifierForRole(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("default-%@"), a1);
}

id SXJSONObjectProtocolFromClassName(const char *a1)
{
  void *v1;
  id v2;
  const char *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCString:encoding:", a1, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringWithRange:", objc_msgSend(v1, "length") != 0, objc_msgSend(v1, "length") - 2);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "cStringUsingEncoding:", 4);

  objc_getProtocol(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_217028DE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21702A1EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id SXJSONObjectCustomObjectValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  const char *Name;
  void *v5;
  void *v6;
  void *v7;
  const char *Uid;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  char *str;

  v3 = a1;
  Name = sel_getName((SEL)a2);
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonPropertyNameForObjCPropertyName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  -[NSDictionary objectForKey:](v3->_jsonDictionary, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 6;
  SXJSONObjectRuntimeConvertValue(v9, &v14, v3, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 5;
    v11 = v9;
  }
  else
  {
    v11 = v10;
  }
  objc_msgSend(v3, Uid, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_21702F0F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

objc_object *SXJSONObjectRuntimeConvertValue(void *a1, int *a2, void *a3, void *a4, objc_class *a5)
{
  objc_object *v9;
  id v10;
  id v11;
  objc_object *v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  objc_object *v18;
  void *v19;
  objc_class *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t (**v24)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[4];

  v41[3] = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a3;
  v11 = a4;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (objc_object *)objc_claimAutoreleasedReturnValue();

    if (v12 != v9)
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = objc_retainAutorelease(v11);
      SXJSONObjectRuntimeGenerateLookupKey(v13, (const char *)objc_msgSend(v14, "UTF8String"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[SXJSONObject lock](SXJSONObject, "lock");
      +[SXJSONObject propertyHashTable](SXJSONObject, "propertyHashTable");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "objectForKey:", v39);

      +[SXJSONObject unlock](SXJSONObject, "unlock");
      if (v16)
        v17 = 6;
      else
        v17 = SXJSONObjectTypeForValue(v9);
      if (a2)
        *a2 = v17;
      if (v17 != 6)
      {
        v18 = v9;
LABEL_28:

        goto LABEL_29;
      }
      if (a5)
      {
LABEL_24:
        if (class_respondsToSelector(a5, sel_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion_))
        {
          objc_msgSend((id)objc_opt_class(), "objectValueClassBlockForPropertyWithName:", v14);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "valueClassBlockForPropertyWithName:", v14);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "purgeClassBlockForPropertyWithName:", v14);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = [a5 alloc];
          objc_msgSend(v10, "specificationVersion");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (objc_object *)objc_msgSend(v31, "initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:", v29, v28, v30, v9, v32);

        }
        else
        {
          if (!class_respondsToSelector(a5, sel_initWithJSONObject_andVersion_))
          {
            v36 = (void *)MEMORY[0x24BDBCE88];
            v40[0] = CFSTR("Parent");
            v40[1] = CFSTR("Property");
            v41[0] = v10;
            v41[1] = v14;
            v40[2] = CFSTR("Class");
            v41[2] = a5;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "exceptionWithName:reason:userInfo:", CFSTR("ClassNotSupportedBySXJSONObject"), CFSTR("The class cannot be initialized because it does not support an initialize function for SXJSONObject"), v37);
            v38 = (id)objc_claimAutoreleasedReturnValue();

            objc_exception_throw(v38);
          }
          v33 = [a5 alloc];
          objc_msgSend(v10, "specificationVersion");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (objc_object *)objc_msgSend(v33, "initWithJSONObject:andVersion:", v9, v34);

        }
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[objc_object objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("type"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
      v20 = (objc_class *)objc_opt_class();
      v21 = objc_retainAutorelease(v14);
      SXJSONObjectRuntimeGenerateLookupKey(v20, (const char *)objc_msgSend(v21, "UTF8String"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SXJSONObject lock](SXJSONObject, "lock");
      +[SXJSONObject propertyHashTable](SXJSONObject, "propertyHashTable");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v22);
      a5 = (objc_class *)objc_claimAutoreleasedReturnValue();

      +[SXJSONObject unlock](SXJSONObject, "unlock");
      if (!v19)
      {
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend((id)objc_opt_class(), "objectValueClassBlockForPropertyWithName:", v21);
      v24 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v10, "specificationVersion");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = ((uint64_t (**)(_QWORD, objc_object *, objc_class *, void *))v24)[2](v24, v9, a5, v25);
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "valueClassBlockForPropertyWithName:", v21);
        v27 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v27;
        if (!v27)
        {
LABEL_22:

          goto LABEL_23;
        }
        v26 = (*(uint64_t (**)(uint64_t, void *, objc_class *))(v27 + 16))(v27, v19, a5);
      }
      a5 = (objc_class *)v26;
      goto LABEL_22;
    }
  }
  v18 = 0;
  if (a2)
    *a2 = 1;
LABEL_29:

  return v18;
}

void sub_21702F574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

double CGSizeFromObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  void *v6;
  double v7;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("width"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatValue");
    v5 = v4;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("height"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v7 = v5;

  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
  }

  return v7;
}

void sub_21702FA98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id SXJSONObjectObjCValueFromObject(SXJSONObject *a1, objc_selector *a2)
{
  SXJSONObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sel_getName((SEL)a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonPropertyNameForObjCPropertyName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKey:](v3->_jsonDictionary, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_21702FB60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id SXJSONObjectCustomUnsignedIntegerValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  const char *Name;
  void *v5;
  void *v6;
  void *v7;
  const char *Uid;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  unsigned int v16;
  char *str;

  v3 = a1;
  Name = sel_getName((SEL)a2);
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonPropertyNameForObjCPropertyName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  -[NSDictionary objectForKey:](v3->_jsonDictionary, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 1;
  v16 = 1;
  if (v9)
  {
    v16 = 6;
    SXJSONObjectRuntimeConvertValue(v9, (int *)&v16, v3, v7, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = v16;
    v13 = (void *)v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(v3, Uid, v13, v11);

  return v14;
}

void sub_217030540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double SXJSONObjectRuntimeCopyCustomGetterName(const char *a1, char **a2)
{
  size_t v4;
  char *v5;
  char *v6;
  double result;

  v4 = strlen(a1);
  v5 = (char *)malloc_type_malloc(v4 + 20, 0x100004077774924uLL);
  *a2 = v5;
  memcpy(v5, a1, v4);
  v6 = &(*a2)[v4];
  *(_DWORD *)(v6 + 15) = 979726457;
  result = *(double *)"WithValue:withType:";
  *(_OWORD *)v6 = *(_OWORD *)"WithValue:withType:";
  (*a2)[v4 + 19] = 0;
  return result;
}

uint64_t NSRangeFromObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("start"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "integerValue");

    if (v4 < 0)
      v4 = -1;
  }
  else
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

void sub_21703077C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectTypeForValue(objc_object *a1)
{
  objc_object *v1;
  uint64_t v2;
  objc_object *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = 2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = 3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v2 = 4;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = 5;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v3 = (objc_object *)objc_claimAutoreleasedReturnValue();
          v2 = v3 == v1;

        }
      }
    }
  }

  return v2;
}

void sub_217031034(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectIntegerValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sel_getName((SEL)a2));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  SXJSONObjectRuntimeValue(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = objc_msgSend(v5, "integerValue");
  }

  return v7;
}

void sub_217031664(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectUnsignedIntegerValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sel_getName((SEL)a2));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  SXJSONObjectRuntimeValue(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    v7 = -1;
  }
  else
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  }

  return v7;
}

void sub_217031738(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id SXJSONObjectCustomIntegerValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  const char *Name;
  void *v5;
  void *v6;
  void *v7;
  const char *Uid;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned int v15;
  char *str;

  v3 = a1;
  Name = sel_getName((SEL)a2);
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonPropertyNameForObjCPropertyName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  -[NSDictionary objectForKey:](v3->_jsonDictionary, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 1;
  v15 = 1;
  if (v9)
  {
    v15 = 6;
    SXJSONObjectRuntimeConvertValue(v9, (int *)&v15, v3, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v3, Uid, v12, v11);

  return v13;
}

void sub_217031890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void *SXJSONObjectAddPrimitiveDefinition(const char *a1, const char *a2, void *a3)
{
  void *v6;
  size_t v7;
  void *v8;
  size_t v9;
  void *v10;
  void *v11;
  void *result;
  int v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if ((SXJSONObjectPrimitivesIsSupportedPrimitive((uint64_t)a2) & 1) == 0)
  {
    v15 = (void *)MEMORY[0x24BDBCE88];
    v19 = CFSTR("Primitive");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exceptionWithName:reason:userInfo:", CFSTR("PrimitiveNotSupported"), CFSTR("The primitive given is not supported, please look at the documentation to see what is supported"), v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v18);
  }
  if (dword_253DDCEFC >= dword_253DDCEF8)
  {
    if (dword_253DDCEF8)
      v6 = malloc_type_realloc((void *)_primitives, 32 * (dword_253DDCEFC + 3), 0x90040F3492DD4uLL);
    else
      v6 = malloc_type_malloc(0x60uLL, 0x90040F3492DD4uLL);
    _primitives = (uint64_t)v6;
    dword_253DDCEF8 += 3;
  }
  v7 = strlen(a1);
  v8 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  memcpy(v8, a1, v7);
  *((_BYTE *)v8 + v7) = 0;
  v9 = strlen(a2);
  v10 = malloc_type_malloc(v9 + 1, 0x100004077774924uLL);
  memcpy(v10, a2, v9);
  *((_BYTE *)v10 + v9) = 0;
  v11 = malloc_type_malloc(v9 + 3, 0x100004077774924uLL);
  result = memcpy(v11, a2, v9);
  strcpy((char *)v11 + v9, "@:");
  v13 = dword_253DDCEFC;
  v14 = (_QWORD *)(_primitives + 32 * dword_253DDCEFC);
  *v14 = v8;
  v14[1] = v10;
  v14[2] = v11;
  v14[3] = a3;
  dword_253DDCEFC = v13 + 1;
  return result;
}

void sub_217031C38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectPrimitivesIsSupportedPrimitive(uint64_t result)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  int v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  char v12[255];
  char __s[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    strcpy(__s, "cislqCISLQfdBb^");
    v2 = *(_BYTE *)result;
    if (*(_BYTE *)result)
    {
      LODWORD(v3) = 0;
      do
      {
        if (v2 == 40 || v2 == 123 || v2 == 91)
        {
          v4 = v3 + 1;
          v5 = (unsigned __int8 *)(v1 + 1 + (int)v3);
          do
          {
            v7 = *v5++;
            v6 = v7;
            if (!v7)
              return 0;
            LODWORD(v3) = v4++;
          }
          while (v6 != 61);
          v8 = 0;
          v9 = v1 + v4;
          v10 = 1;
          do
          {
            v11 = *(unsigned __int8 *)(v9 + v8);
            if (v11 == 40 || v11 == 123 || v11 == 91)
              ++v10;
            if (v11 == 41 || v11 == 125 || v11 == 93)
              --v10;
            v12[v8++] = v11;
            LODWORD(v3) = v3 + 1;
          }
          while (v10);
          v12[v8 - 1] = 0;
          if ((SXJSONObjectPrimitivesIsSupportedPrimitive(v12) & 1) == 0)
            return 0;
        }
        else
        {
          result = (uint64_t)strchr(__s, v2);
          if (!result)
            return result;
        }
        v3 = (int)v3 + 1;
        v2 = *(_BYTE *)(v1 + v3);
      }
      while (v2);
    }
    return 1;
  }
  return result;
}

void *SXComponentContentInsetJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("_SXComponentContentInset", "{_SXComponentContentInset=BBBBB}", SXComponentContentInsetObjCValue);
}

void *SXDataTablePaddingJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("_SXDataTablePadding", "{?=dddd}", SXDataTablePaddingObjCValue);
}

void *MKCoordinateRegionJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("MKCoordinateRegion", "{?={CLLocationCoordinate2D=dd}{?=dd}}", MKCoordinateRegionObjCValue);
}

void *MKCoordinateSpanJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("MKCoordinateSpan", "{?=dd}", MKCoordinateSpanObjCValue);
}

void *UIEdgeInsetsJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("UIEdgeInsets", "{UIEdgeInsets=dddd}", UIEdgeInsetsFromObjCValue);
}

void *CLLocationCoordinate2DJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("CLLocationCoordinate2D", "{CLLocationCoordinate2D=dd}", CLLocationCoordinate2DObjCValue);
}

void *NSRangeJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("_NSRange", "{_NSRange=QQ}", NSRangeFromObjCValue);
}

void *CGPointJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("CGPoint", "{CGPoint=dd}", CGPointFromObjCValue);
}

void *CGSizeJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("CGSize", "{CGSize=dd}", CGSizeFromObjCValue);
}

void SXSetupLogging()
{
  if (SXSetupLogging_onceToken != -1)
    dispatch_once(&SXSetupLogging_onceToken, &__block_literal_global_38);
}

void *SXConvertibleValueJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("_SXConvertibleValue", "{_SXConvertibleValue=dQ}", SXConvertibleValueObjCValue);
}

void sub_217038D28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217039554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21703C3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2170438D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_217043C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217043FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void sub_21704B854(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21704C808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21704CBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217050AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34,id a35)
{
  id *v35;
  id *v36;
  uint64_t v37;

  objc_destroyWeak(v36);
  objc_destroyWeak(v35);
  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak(&a34);
  objc_destroyWeak(&a35);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_217057644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_217057818(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_217057968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_217057BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217059520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  id *v36;

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

id SXConditionTypes()
{
  if (SXConditionTypes_onceToken != -1)
    dispatch_once(&SXConditionTypes_onceToken, &__block_literal_global_9);
  return (id)SXConditionTypes_types;
}

void sub_21705B5A8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Unwind_Resume(a1);
}

void sub_2170632D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2170649F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

id _block_invoke(int a1, int a2, id a3)
{
  return a3;
}

void sub_217064ADC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_217067EC0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 88));
  _Unwind_Resume(a1);
}

void sub_217069D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217069E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double CGSizeAspectFill(double result, double a2, double a3, double a4)
{
  double v4;
  double v7;

  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (*MEMORY[0x24BDBF148] == result && v4 == a2)
    return a3;
  if (*MEMORY[0x24BDBF148] != a3 || v4 != a4)
  {
    v7 = a2 / a4;
    if (result / a3 >= v7)
      v7 = result / a3;
    return result * v7 / (result * v7 / a3);
  }
  return result;
}

double CalculateMargin(double a1, double a2, double a3)
{
  return a2 / a3 * a1;
}

double CalculateColumnWidth(uint64_t a1, double a2, double a3, double a4)
{
  float v4;

  v4 = (a2 + a3 * -2.0 - (double)(a1 - 1) * a4) / (double)a1;
  return floorf(v4);
}

double CalculateMinimumColumnWidth(uint64_t a1, double a2, double a3, double a4)
{
  float v4;

  v4 = (a2 + a3 * -2.0 - (a4 * (double)a1 + -1.0)) / (double)a1;
  return floorf(v4);
}

const char **SXJSONObjectEntryForName(const char *__s2)
{
  uint64_t v1;
  const char **v3;
  int v4;

  if (!__s2)
    return 0;
  v1 = dword_253DDCEFC;
  if (dword_253DDCEFC < 1)
    return 0;
  v3 = (const char **)_primitives;
  v4 = *(unsigned __int8 *)__s2;
  while (*(unsigned __int8 *)*v3 != v4 || strcmp(*v3, __s2))
  {
    v3 += 4;
    if (!--v1)
      return 0;
  }
  return v3;
}

const char **SXJSONObjectPrimitivesEncodeForName(const char *a1)
{
  const char **result;

  result = SXJSONObjectEntryForName(a1);
  if (result)
    return (const char **)result[1];
  return result;
}

double CLLocationCoordinate2DObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  double v8;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("latitude"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("longitude"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
    objc_msgSend(v4, "doubleValue");
    *(_QWORD *)&v8 = *(_OWORD *)&CLLocationCoordinate2DMake(v6, v7);

  }
  else
  {
    *(_QWORD *)&v8 = *(_OWORD *)&CLLocationCoordinate2DMake(0.0, 0.0);
  }

  return v8;
}

void sub_217081A08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id SXBundle()
{
  if (SXBundle_onceToken != -1)
    dispatch_once(&SXBundle_onceToken, &__block_literal_global_32);
  return (id)SXBundle___SXBundle;
}

double CGPointFromObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  void *v6;
  double v7;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("x"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatValue");
    v5 = v4;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("y"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v7 = v5;

  }
  else
  {
    v7 = *MEMORY[0x24BDBEFB0];
  }

  return v7;
}

void sub_217089334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21708D400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217090CAC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_21709196C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_217091DCC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2170923DC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2170925C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21709284C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id *SXComponentDependencyCreate(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return +[SXComponentDependency componentDependencyFromComponentIdentifier:toComponentIdentifier:fromLayoutAttribute:toAttribute:withDescriptor:]((uint64_t)SXComponentDependency, a1, a2, a3, a4, a5);
}

__CFString *NSStringFromDependencyAttribute(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("None");
  v1 = CFSTR("Size");
  if (a1 == 1)
    v1 = CFSTR("Position");
  return v1;
}

void sub_2170987DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_217098AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217098F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21709922C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double UIEdgeInsetsFromObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("top"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("bottom"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("left"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("right"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    objc_msgSend(v4, "floatValue");
    objc_msgSend(v6, "floatValue");
    v9 = v8;

  }
  else
  {
    v9 = *MEMORY[0x24BDF7718];
  }

  return v9;
}

void sub_2170A42D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2170A6EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void SXJSONObjectRuntimeAddSetterToClass(objc_class *a1, const char *a2, const char *a3)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("NotImplemented"), CFSTR("Currently not implemented"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

void *SXJSONObjectRuntimeCopyPropertyTypeEncoding(const char *a1, char **a2)
{
  const char *v3;
  size_t v4;
  uint64_t v6;
  int v7;
  size_t v8;
  char *v9;
  void *result;

  v3 = a1 + 1;
  if (a1[1] == 44)
  {
    v4 = 1;
  }
  else
  {
    v4 = strlen(a1);
    v6 = 0;
    if (v4 <= 1)
      v4 = 1;
    while (v4 - 1 != v6)
    {
      v7 = a1[v6++ + 2];
      if (v7 == 44)
      {
        v4 = v6 + 1;
        break;
      }
    }
  }
  v8 = v4 - 1;
  v9 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
  *a2 = v9;
  result = memcpy(v9, v3, v8);
  (*a2)[v8] = 0;
  return result;
}

uint64_t SXDefaultTextStyleIdentifierForRole(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("default-%@"), a1);
}

void sub_2170AB7B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2170B1794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SXComponentContentInsetObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v3, "BOOLValue"))
      {

        v4 = 1;
        v5 = 0x100000000;
        v6 = 1;
        v7 = 1;
LABEL_15:
        v15 = 0x1000000;
        return v5 | v15 | (v4 << 16) | (v6 << 8) | v7;
      }
      goto LABEL_11;
    }
  }
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:

    v5 = 0;
    v4 = 0;
    v6 = 0;
    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("left"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("top"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("right"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("bottom"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v6 & v10) == 1)
  {
    v7 = v12 & v14;

    v6 = 1;
    v4 = 1;
    if ((v14 & 1) == 0)
      goto LABEL_9;
  }
  else
  {
    v4 = v10 & ~(_DWORD)v6;

    v7 = 0;
    if (!v14)
    {
LABEL_9:
      v5 = 0;
      v15 = 0;
      if (!v12)
        return v5 | v15 | (v4 << 16) | (v6 << 8) | v7;
      goto LABEL_15;
    }
  }
  v5 = 0x100000000;
  if ((v12 & 1) != 0)
    goto LABEL_15;
LABEL_12:
  v15 = 0;
  return v5 | v15 | (v4 << 16) | (v6 << 8) | v7;
}

void sub_2170B1D60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double SXJSONObjectCustomFloatValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  const char *Name;
  void *v5;
  void *v6;
  void *v7;
  const char *Uid;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  unsigned int v16;
  char *str;

  v3 = a1;
  Name = sel_getName((SEL)a2);
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonPropertyNameForObjCPropertyName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  -[NSDictionary objectForKey:](v3->_jsonDictionary, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 1;
  v16 = 1;
  if (v9)
  {
    v16 = 6;
    SXJSONObjectRuntimeConvertValue(v9, (int *)&v16, v3, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v3, Uid, v12, v11);
  v14 = v13;

  return v14;
}

void sub_2170B20EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id SXJSONObjectCustomBoolValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  const char *Name;
  void *v5;
  void *v6;
  void *v7;
  const char *Uid;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned int v15;
  char *str;

  v3 = a1;
  Name = sel_getName((SEL)a2);
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonPropertyNameForObjCPropertyName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  -[NSDictionary objectForKey:](v3->_jsonDictionary, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 1;
  v15 = 1;
  if (v9)
  {
    v15 = 6;
    SXJSONObjectRuntimeConvertValue(v9, (int *)&v15, v3, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v3, Uid, v12, v11);

  return v13;
}

void sub_2170B2268(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t SXSpecVersionCompare(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a2;
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  if (v6 | objc_msgSend(v5, "count"))
  {
    v7 = 0;
    while (1)
    {
      v8 = CFSTR("0");
      if (v7 < objc_msgSend(v4, "count"))
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v9 = CFSTR("0");
      if (v7 < objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "objectAtIndex:", v7);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v10 = -[__CFString compare:options:](v8, "compare:options:", v9, 64);

      if (v10)
        break;
      ++v7;
      v11 = objc_msgSend(v4, "count");
      v12 = objc_msgSend(v5, "count");
      if (v11 <= v12)
        v13 = v12;
      else
        v13 = v11;
      if (v7 >= v13)
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v10 = 0;
  }

  return v10;
}

void sub_2170B9F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2170BA45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2170BA790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2170C32FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2170C4E24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2170C4F2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2170C4FA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2170C50AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2170C5270(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2170C5450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2170C5588(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2170C5644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_2170C5778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2170C5888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_2170C5928(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SXCanvasCreate(void *a1, id *a2, _QWORD *a3)
{
  SXCanvasCreateWithClass(a1, a2, a3, 0, 0);
}

void SXCanvasCreateWithClass(void *a1, id *a2, _QWORD *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  SXTextTangierCanvasEditor *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a1;
  if (!a2 || !a3)
    goto LABEL_15;
  v21 = v9;
  if (a4)
  {
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    a4 = (void *)objc_opt_class();
    if (!a5)
LABEL_7:
      a5 = (void *)objc_opt_class();
  }
  if ((objc_msgSend(a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void SXCanvasCreateWithClass(__strong id<TSDInteractiveCanvasControllerDelegate>, TSDInteractiveCanvasController *__autoreleasing *, __autoreleasing id<TSDCanvasLayerHosting> *, __unsafe_unretained Class, __unsafe_unretained Class)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTangierCanvasUtilities.mm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 42, CFSTR("bogus ICC class"));

  }
  if ((objc_msgSend(a5, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void SXCanvasCreateWithClass(__strong id<TSDInteractiveCanvasControllerDelegate>, TSDInteractiveCanvasController *__autoreleasing *, __autoreleasing id<TSDCanvasLayerHosting> *, __unsafe_unretained Class, __unsafe_unretained Class)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTangierCanvasUtilities.mm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 43, CFSTR("bogus CVC class"));

  }
  v16 = *a2;
  if (!v16)
  {
    v16 = objc_alloc_init((Class)a4);
    objc_msgSend(v16, "setDelegate:", v21);
    v17 = -[TSDCanvasEditor initWithInteractiveCanvasController:]([SXTextTangierCanvasEditor alloc], "initWithInteractiveCanvasController:", v16);
    objc_msgSend(v16, "setCanvasEditor:", v17);

  }
  v18 = objc_alloc_init((Class)a5);
  objc_msgSend(v16, "setLayerHost:", v18);
  objc_msgSend(v18, "setInteractiveCanvasController:", v16);
  v19 = objc_retainAutorelease(v16);
  *a2 = v19;
  v20 = objc_retainAutorelease(v18);
  *a3 = v20;

  v9 = v21;
LABEL_15:

}

void sub_2170C65E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2170C7C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2170C8014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2170CA2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  id *v26;
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)(v28 - 120));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2170CAB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double MKCoordinateSpanObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  double v6;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    v3 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("latitudeDelta"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKey:", CFSTR("longitudeDelta"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "doubleValue");
      v3 = v6;
      objc_msgSend(v5, "doubleValue");

    }
  }
  else
  {
    v3 = 0.0;
  }

  return v3;
}

void sub_2170CFE44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double SXJSONObjectFloatValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  NSString *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sel_getName((SEL)a2));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  SXJSONObjectRuntimeValue(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    v8 = 1.79769313e308;
  }
  else
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
  }

  return v8;
}

void sub_2170D2058(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectBoolValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  SXJSONObject *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sel_getName((SEL)a2));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  SXJSONObjectRuntimeValue(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "BOOLValue");
  }

  return v7;
}

void sub_2170D212C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2170D7D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2170D824C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2170D9810(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2_1(id a1)
{
  return a1;
}

void sub_2170E4BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t charToInt(int a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;

  v1 = a1 - 48;
  if ((a1 - 65) >= 6)
    v2 = 0;
  else
    v2 = a1 - 55;
  if ((a1 - 97) <= 5)
    v3 = a1 - 87;
  else
    v3 = v2;
  if (v1 <= 9)
    return v1;
  else
    return v3;
}

void sub_2170EADF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2170EB0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2170EB358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2170EB5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2170EB850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2170ED048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_2170EFDD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2170EFF78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2170F0924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21,uint64_t a22,void *a23,uint64_t a24,void *a25)
{

  _Unwind_Resume(a1);
}

void sub_2170F0FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_2170F13E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2170F1678(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2170F1880(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2170F1C4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2170F4BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2170FBBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id *location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a65;
  char a66;

  objc_destroyWeak(location);
  objc_destroyWeak(&a65);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose(&STACK[0x288], 8);
  _Unwind_Resume(a1);
}

void sub_2171001B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

void sub_2171011EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

double SXConvertibleValueObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  double result;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lipt"), objc_msgSend(v2, "integerValue"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  v4 = v2;
  objc_msgSend(v4, "floatValue");
  v5 = v4;
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "hasSuffix:", CFSTR("pt")) & 1) == 0
    && (objc_msgSend(v6, "hasSuffix:", CFSTR("vh")) & 1) == 0
    && (objc_msgSend(v6, "hasSuffix:", CFSTR("vw")) & 1) == 0
    && (objc_msgSend(v6, "hasSuffix:", CFSTR("vmin")) & 1) == 0
    && (objc_msgSend(v6, "hasSuffix:", CFSTR("vmax")) & 1) == 0
    && (objc_msgSend(v6, "hasSuffix:", CFSTR("gut")) & 1) == 0
    && (objc_msgSend(v6, "hasSuffix:", CFSTR("dg")) & 1) == 0
    && (objc_msgSend(v6, "hasSuffix:", CFSTR("cw")) & 1) == 0
    && (objc_msgSend(v6, "hasSuffix:", CFSTR("dm")) & 1) == 0)
  {
    objc_msgSend(v6, "hasSuffix:", CFSTR("pw"));
  }

  return result;
}

void sub_217105C0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void UIBezierPathSilexPathApplier(void *a1, const CGPathElement *a2)
{
  void *v3;
  double *v4;
  uint64_t v5;
  double *v6;
  double *v7;
  double v8;
  CGPoint *points;
  CGPoint *v10;
  id v11;

  v3 = a1;
  v11 = v3;
  switch(a2->type)
  {
    case kCGPathElementMoveToPoint:
      objc_msgSend(v3, "moveToPoint:", a2->points->x, a2->points->y);
      v3 = v11;
      break;
    case kCGPathElementAddLineToPoint:
      objc_msgSend(v3, "lineToPoint:", a2->points->x, a2->points->y);
      v3 = v11;
      break;
    case kCGPathElementAddQuadCurveToPoint:
      v4 = (double *)malloc_type_calloc(3uLL, 0x10uLL, 0x1000040451B5BE8uLL);
      v5 = objc_msgSend(v11, "elementAtIndex:associatedPoints:", objc_msgSend(v11, "elementCount") - 1, v4);
      v6 = (double *)MEMORY[0x24BDBEFB0];
      v7 = (double *)(MEMORY[0x24BDBEFB0] + 8);
      if (!v5)
      {
        v6 = v4;
        v7 = v4 + 1;
      }
      if (v5 == 1)
      {
        v6 = v4;
        v7 = v4 + 1;
      }
      if (v5 == 2)
      {
        v6 = v4 + 4;
        v7 = v4 + 5;
      }
      v8 = *v6;
      points = a2->points;
      objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", points[1].x, points[1].y, v8 + (points->x - v8) * 0.666666687, *v7 + (points->y - *v7) * 0.666666687, points[1].x + (points->x - points[1].x) * 0.666666687, points[1].y + (points->y - points[1].y) * 0.666666687);
      v3 = v11;
      break;
    case kCGPathElementAddCurveToPoint:
      v10 = a2->points;
      objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v10[2].x, v10[2].y, v10->x, v10->y, v10[1].x, v10[1].y);
      v3 = v11;
      break;
    case kCGPathElementCloseSubpath:
      objc_msgSend(v3, "closePath");
      v3 = v11;
      break;
    default:
      break;
  }

}

void sub_217107DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_217107E58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_217108B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21710FA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double MKCoordinateRegionObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  double v12;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("center"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("span"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("latitude"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("longitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("latitudeDelta"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("longitudeDelta"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v10 = v9;
    objc_msgSend(v6, "doubleValue");
    *(_QWORD *)&v12 = *(_OWORD *)&CLLocationCoordinate2DMake(v10, v11);
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "doubleValue");

  }
  else
  {
    *(_QWORD *)&v12 = *(_OWORD *)&CLLocationCoordinate2DMake(0.0, 0.0);
  }

  return v12;
}

void sub_21711191C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_217112898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_217113A3C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21711AE78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21711AF38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21711B048(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21711B118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_21711B1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21711B450(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21711B50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21711B628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21711B754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21711B7E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21711B8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21711B91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21711B984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21711BA6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21711BB54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21711BCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21711BD68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21711BDC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21711BE3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21711BF58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21711C0CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21711D1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a72;
  uint64_t v72;

  objc_destroyWeak(location);
  objc_destroyWeak(&a72);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose((const void *)(v72 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_21711D61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double SXDataTablePaddingObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  void *v2;
  float v3;
  float v4;
  double v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;

  SXJSONObjectObjCValueFromObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "floatValue");
    v4 = v3;
    objc_msgSend(v2, "floatValue");
    objc_msgSend(v2, "floatValue");
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("top"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      v8 = v7;
      objc_msgSend(v2, "objectForKey:", CFSTR("right"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      objc_msgSend(v2, "objectForKey:", CFSTR("bottom"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      objc_msgSend(v2, "objectForKey:", CFSTR("left"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v5 = v8;

    }
    else
    {
      v5 = 1.79769313e308;
    }
  }

  return v5;
}

void sub_21711DE90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_21711E504(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  void *v13;
  _QWORD *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(exception_object);
    v16 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v18 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v15, "reason");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXTextSource initWithString:smartFieldFactory:dataSource:documentLanguageProvider:fontAttributesConstructor:].cold.1((void *)objc_msgSend(v18, "initWithFormat:", CFSTR("A %@ exception was detected while inserting and removing newlines from string: %@")), &buf, v24);
    }

    objc_msgSend(v14, "deletedRangeOffsets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeAllIndexes");

    objc_msgSend(v14, "insertedRangeOffsets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeAllIndexes");

    objc_msgSend(v14, "rangesExcludedOfParagraphSpacing");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeAllIndexes");

    v22 = objc_msgSend(v13, "copy");
    v23 = (void *)v14[2];
    v14[2] = v22;

    objc_end_catch();
    JUMPOUT(0x21711E4B0);
  }
  _Unwind_Resume(exception_object);
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDB1C88]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDE5590](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D8](retstr, tx, ty, tz);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x24BDAC240](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x24BDAC248](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x24BDAC250](ctx, data, dataLength);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x24BDBC720](tokenizer, index);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x24BDBE028](c, lengths, count, phase);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE1A0](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9140](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9178](provider, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

BOOL CGPathIsRect(CGPathRef path, CGRect *rect)
{
  return MEMORY[0x24BDBEF28](path, rect);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x24BDC4878]();
}

uint64_t IsWhitespaceCharacter()
{
  return MEMORY[0x24BEB3A60]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  double v1;
  double v2;
  MKMapPoint result;

  MEMORY[0x24BDDAF98]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x24BE6CF48]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t TFCallbackScopeAny()
{
  return MEMORY[0x24BEB47A0]();
}

uint64_t TSDDistance()
{
  return MEMORY[0x24BEB3B90]();
}

uint64_t TSDRectWithSize()
{
  return MEMORY[0x24BEB3B98]();
}

uint64_t TSDSubtractPoints()
{
  return MEMORY[0x24BEB3BA0]();
}

uint64_t String()
{
  return MEMORY[0x24BEB3BA8]();
}

{
  return MEMORY[0x24BEB3BB0]();
}

{
  return MEMORY[0x24BEB3BB8]();
}

uint64_t TSUClassAndProtocolCast()
{
  return MEMORY[0x24BEB3D80]();
}

uint64_t TSUDynamicCast()
{
  return MEMORY[0x24BEB3E08]();
}

uint64_t TSUProtocolCast()
{
  return MEMORY[0x24BEB3F30]();
}

uint64_t TSWPFastCreateFontForStyle()
{
  return MEMORY[0x24BEB3BC0]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDF7218](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x24BDF7280]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

uint64_t UIAccessibilityLanguageForLanguage()
{
  return MEMORY[0x24BEBB020]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BDF7668](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t TSWPFontHeightInfoForFont(const __CTFont *a1)
{
  return MEMORY[0x24BEB3BD8](a1);
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x24BEDCE78](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x24BEDCE80](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x24BEDCEF8](cls, sel);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x24BEDD0B8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD110](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x24BEDD4A0](property, outCount);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x24BEDD4B0](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x24BEDD4B8](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x24BEDD4D8](proto, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x24BEDD4E0](proto, outCount);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return MEMORY[0x24BEDD4F8](proto, other);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x24BEDD508](str);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x24BEDD518](str);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0010](__str, __endptr, *(_QWORD *)&__base);
}

