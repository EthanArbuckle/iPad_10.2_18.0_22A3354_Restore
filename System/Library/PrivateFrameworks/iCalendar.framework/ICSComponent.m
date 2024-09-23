@implementation ICSComponent

- (void)setUnrecognizedComponentName:(id)a3
{
  NSString *v5;
  NSString **p_unrecognizedComponentName;
  NSString *unrecognizedComponentName;
  NSString *v8;

  v5 = (NSString *)a3;
  unrecognizedComponentName = self->_unrecognizedComponentName;
  p_unrecognizedComponentName = &self->_unrecognizedComponentName;
  if (unrecognizedComponentName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_unrecognizedComponentName, a3);
    v5 = v8;
  }

}

- (NSString)unrecognizedComponentName
{
  return self->_unrecognizedComponentName;
}

+ (unint64_t)relationshipTypeFromString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("X-CALENDARSERVER-RECURRENCE-SET"));
}

+ (id)stringFromRelationshipType:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("X-CALENDARSERVER-RECURRENCE-SET");
  else
    return 0;
}

+ (id)stringFromStatus:(int)a3
{
  if ((a3 - 1) > 7)
    return 0;
  else
    return *off_1E953A758[a3 - 1];
}

+ (int)statusFromString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TENTATIVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIRMED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS-ACTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CANCELLED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN-PROCESS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRAFT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FINAL")) & 1) != 0)
  {
    v4 = 7;
  }
  else
  {
    objc_msgSend(v3, "length");
    v4 = 0;
  }

  return v4;
}

+ (id)makeUID
{
  const __CFAllocator *v2;
  const __CFUUID *v3;
  __CFString *v4;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  CFRelease(v3);
  return v4;
}

+ (id)name
{
  return 0;
}

- (ICSComponent)init
{
  ICSComponent *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *properties;
  NSMutableArray *v5;
  NSMutableArray *components;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSComponent;
  v2 = -[ICSComponent init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    properties = v2->_properties;
    v2->_properties = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    components = v2->_components;
    v2->_components = v5;

  }
  return v2;
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSComponent;
  -[ICSComponent description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)validate:(id *)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_components;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "validate:", a3, (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)removePropertiesForName:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", a3);
}

- (id)propertiesForName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3);
}

- (void)setProperties:(id)a3 forName:(id)a4
{
  NSMutableDictionary *properties;

  properties = self->_properties;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](properties, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", a4);
}

- (void)setProperty:(id)a3 forName:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99DE8];
    v7 = a4;
    v8 = (id)objc_msgSend([v6 alloc], "initWithObjects:", v9, 0);
    -[ICSComponent setProperties:forName:](self, "setProperties:forName:", v8, v7);

  }
  else
  {
    v8 = a4;
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", v8);
  }

}

- (void)ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  ICSStringWriter *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _BOOL8 v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  ICSComponent *v54;
  uint64_t v55;
  id obj;
  __int16 v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3 & 8;
  -[ICSComponent propertiesToExcludeForChecksum](self, "propertiesToExcludeForChecksum");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "name");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[ICSComponent unrecognizedComponentName](self, "unrecognizedComponentName");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendString:", CFSTR("BEGIN:"));
  v50 = (void *)v8;
  objc_msgSend(v6, "appendString:", v8);
  objc_msgSend(v6, "appendString:", CFSTR("\r\n"));
  -[NSMutableDictionary allKeys](self->_properties, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v57 = a3;
  v11 = a3 | (v7 >> 1);
  if ((v11 & 4) != 0)
  {
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v10 = v12;
  }
  else
  {
    v61 = 0;
  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  v60 = v11;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v75;
    v53 = v7;
    v54 = self;
    v52 = *(_QWORD *)v75;
    do
    {
      v16 = 0;
      v55 = v14;
      do
      {
        if (*(_QWORD *)v75 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v16);
        if (!-[ICSComponent ignorePropertyWithName:](self, "ignorePropertyWithName:", v17)
          && (!v7 || (objc_msgSend(v51, "containsObject:", v17) & 1) == 0))
        {
          v58 = v16;
          -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v17);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v57;
          if ((v57 & 0x200) == 0
            || (-[ICSComponent propertiesToHide](self, "propertiesToHide"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v19, "containsObject:", v17),
                v19,
                v18 = v57,
                (v20 & 1) == 0))
          {
            v65 = v17;
            if ((v18 & 0x10) != 0)
            {
              -[ICSComponent propertiesToObscure](self, "propertiesToObscure");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = objc_msgSend(v21, "containsObject:", v17);

            }
            else
            {
              v64 = 0;
            }
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v62 = v59;
            v22 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
            if (v22)
            {
              v23 = v22;
              v63 = *(_QWORD *)v71;
              do
              {
                v24 = 0;
                do
                {
                  if (*(_QWORD *)v71 != v63)
                    objc_enumerationMutation(v62);
                  v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v24);
                  v26 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
                  objc_msgSend(v26, "appendString:", v65);
                  if (v64)
                  {
                    v27 = objc_alloc_init(ICSStringWriter);
                    objc_msgSend(v25, "ICSStringWithOptions:appendingToString:", v11, v27);
                    -[ICSStringWriter result](v27, "result");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v28, "hasPrefix:", CFSTR(":")))
                    {
                      objc_msgSend(v28, "substringFromIndex:", 1);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = v6;
                      v31 = (void *)MEMORY[0x1E0CB3940];
                      ICSRedactString(v29);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "stringWithFormat:", CFSTR(":%@"), v32);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "appendString:", v33);

                      v6 = v30;
                      v11 = v60;

                    }
                    else
                    {
                      ICSRedactString(v28);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "appendString:", v29);
                    }

                  }
                  else
                  {
                    v27 = -[ICSStringWriter initWithString:]([ICSStringWriter alloc], "initWithString:", v26);
                    objc_msgSend(v25, "ICSStringWithOptions:appendingToString:", v11, v27);
                    -[ICSStringWriter mutableResult](v27, "mutableResult");
                    v28 = v26;
                    v26 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  if ((v57 & 0x48) == 0)
                  {
                    if (objc_msgSend(v26, "length"))
                    {
                      v34 = objc_msgSend(v26, "length") - 1;
                      if (v34 >= 0x48)
                      {
                        v35 = 0;
                        v36 = v34 / 0x48;
                        v37 = 72 * (v34 / 0x48);
                        do
                        {
                          v38 = (objc_msgSend(v26, "characterAtIndex:", v37) & 0xFC00) == 56320;
                          v39 = v37 - v38;
                          if (v37 - v38 != v35)
                          {
                            objc_msgSend(v26, "insertString:atIndex:", CFSTR("\r\n "), v37 - v38);
                            v35 = v39;
                          }
                          v37 -= 72;
                          --v36;
                        }
                        while (v36);
                      }
                    }
                  }
                  objc_msgSend(v26, "appendString:", CFSTR("\r\n"));
                  if ((v11 & 4) != 0)
                    objc_msgSend(v61, "addObject:", v26);
                  else
                    objc_msgSend(v6, "appendString:", v26);

                  ++v24;
                }
                while (v24 != v23);
                v40 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
                v23 = v40;
              }
              while (v40);
            }

            v7 = v53;
            self = v54;
            v14 = v55;
            v15 = v52;
          }

          v16 = v58;
        }
        ++v16;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    }
    while (v14);
  }

  if ((v11 & 4) != 0)
  {
    objc_msgSend(v61, "sortedArrayUsingSelector:", sel_compare_);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "componentsJoinedByString:", &stru_1E953C148);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v42);

  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v43 = self->_components;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v67 != v46)
          objc_enumerationMutation(v43);
        v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        v49 = (void *)MEMORY[0x1D824FCDC]();
        objc_msgSend(v48, "ICSStringWithOptions:appendingToString:", v60, v6);
        objc_autoreleasePoolPop(v49);
      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    }
    while (v45);
  }

  objc_msgSend(v6, "appendString:", CFSTR("END:"));
  objc_msgSend(v6, "appendString:", v50);
  objc_msgSend(v6, "appendString:", CFSTR("\r\n"));

}

- (BOOL)ignorePropertyWithName:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (((objc_msgSend(v4, "isEqualToString:", CFSTR("X-MICROSOFT-CDO-ALLDAYEVENT")) & 1) != 0
     || objc_msgSend(v4, "isEqualToString:", CFSTR("X-FUNAMBOL-ALLDAY")))
    && !-[ICSComponent isAllDay](self, "isAllDay"))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("iCalendar-ForcedAllDay"));
  }

  return v5;
}

- (id)ICSStringWithOptions:(unint64_t)a3
{
  ICSStringWriter *v5;
  void *v6;

  v5 = objc_alloc_init(ICSStringWriter);
  -[ICSComponent ICSStringWithOptions:appendingToString:](self, "ICSStringWithOptions:appendingToString:", a3, v5);
  -[ICSStringWriter result](v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)propertiesToExcludeForChecksum
{
  if (propertiesToExcludeForChecksum_onceToken != -1)
    dispatch_once(&propertiesToExcludeForChecksum_onceToken, &__block_literal_global);
  return (NSSet *)(id)propertiesToExcludeForChecksum_propertiesToExclude;
}

void __46__ICSComponent_propertiesToExcludeForChecksum__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("DTSTAMP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesToExcludeForChecksum_propertiesToExclude;
  propertiesToExcludeForChecksum_propertiesToExclude = v2;

}

- (id)propertiesToObscure
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SUMMARY"), CFSTR("DESCRIPTION"), CFSTR("URL"), CFSTR("COMMENT"), CFSTR("X-CALENDARSERVER-PRIVATE-COMMENT"), CFSTR("LOCATION"), 0);
}

- (id)propertiesToHide
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("X-CALENDARSERVER-PRIVATE-COMMENT"), CFSTR("X-CALENDARSERVER-ATTENDEE-COMMENT"), 0);
}

- (BOOL)shouldObscureParameter:(id)a3
{
  return 0;
}

- (BOOL)shouldObscureValue
{
  return 0;
}

- (NSMutableArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_storeStrong((id *)&self->_components, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unrecognizedComponentName, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)addComponent:(id)a3 withUIDGenerator:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    v5 = a3;
    -[ICSComponent components](self, "components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[ICSComponent components](self, "components");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

      -[ICSComponent setComponents:](self, "setComponents:", v10);
    }
    -[ICSComponent components](self, "components");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);

  }
}

- (void)removeComponent:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = a3;
    -[ICSComponent components](self, "components");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[ICSComponent components](self, "components");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

      -[ICSComponent setComponents:](self, "setComponents:", v9);
    }
    -[ICSComponent components](self, "components");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v4);

  }
}

- (void)addProperty:(id)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && v6)
  {
    -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
          v9 = objc_claimAutoreleasedReturnValue();

          -[ICSComponent setProperties:forName:](self, "setProperties:forName:", v9, v10);
          v8 = (void *)v9;
        }
        objc_msgSend(v8, "addObject:", v6);
      }
    }
    else
    {
      -[ICSComponent setProperty:forName:](self, "setProperty:forName:", v6, v10);
    }

  }
}

- (id)properties
{
  return self->_properties;
}

- (id)allProperties
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  -[ICSComponent properties](self, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)attach
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("ATTACH"));
}

- (void)setAttach:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("ATTACH"));
}

- (NSArray)attendee
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("ATTENDEE"));
}

- (void)setAttendee:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("ATTENDEE"));
}

- (int)classification
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("CLASS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "longValue");
  else
    v5 = 0;

  return v5;
}

- (void)setClassification:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSPredefinedValue numberWithLong:](ICSClassificationValue, "numberWithLong:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5005, CFSTR("CLASS"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("CLASS"));
  }
}

- (ICSDate)created
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("CREATED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setCreated:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("CREATED"));
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DESCRIPTION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDescription:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("DESCRIPTION"));
}

- (void)setPropertyValue:(id)a3 forName:(id)a4
{
  id v6;
  ICSProperty *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    v6 = a4;
    v7 = -[ICSProperty initWithValue:type:]([ICSProperty alloc], "initWithValue:type:", v8, 5007);
    -[ICSComponent setProperty:forName:](self, "setProperty:forName:", v7, v6);

  }
  else
  {
    v7 = (ICSProperty *)a4;
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", v7);
  }

}

- (void)setPropertyValue:(id)a3 type:(int)a4 forName:(id)a5
{
  id v8;
  ICSProperty *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    v8 = a5;
    v9 = -[ICSProperty initWithValue:type:]([ICSProperty alloc], "initWithValue:type:", v10, a4);
    -[ICSComponent setProperty:forName:](self, "setProperty:forName:", v9, v8);

  }
  else
  {
    v9 = (ICSProperty *)a5;
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", v9);
  }

}

- (ICSDate)dtstamp
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTSTAMP"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setDtstamp:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("DTSTAMP"));
}

- (ICSDate)dtstart
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTSTART"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setDtstart:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("DTSTART"));
}

- (BOOL)isAllDay
{
  int v3;
  void *v4;

  if (-[ICSComponent forcedAllDay](self, "forcedAllDay"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[ICSComponent dtstart](self, "dtstart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hasTimeComponent") ^ 1;

  }
  return v3;
}

- (ICSDate)dtend
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTEND"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setDtend:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("DTEND"));
  if (a3)
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("DURATION"));
}

- (ICSDuration)duration
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DURATION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDuration *)v4;
}

- (void)setDuration:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("DTEND"));
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5011, CFSTR("DURATION"));

}

- (void)setExdate:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("EXDATE"));
}

- (NSArray)exdate
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXDATE"));
}

- (void)setExrule:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ICSProperty *v12;
  ICSProperty *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = [ICSProperty alloc];
        v13 = -[ICSProperty initWithValue:type:](v12, "initWithValue:type:", v11, 5029, (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", v5, CFSTR("EXRULE"));
}

- (NSArray)exrule
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXRULE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "value", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (ICSDate)last_modified
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("LAST-MODIFIED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setLast_modified:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("LAST-MODIFIED"));
}

- (NSString)location
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("LOCATION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setLocation:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("LOCATION"));
}

- (ICSUserAddress)organizer
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("ORGANIZER"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSUserAddress *)v3;
}

- (void)setOrganizer:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("ORGANIZER"));
}

- (void)setRdate:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("RDATE"));
}

- (NSArray)rdate
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RDATE"));
}

- (ICSDate)recurrence_id
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RECURRENCE-ID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setRecurrence_id:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("RECURRENCE-ID"));
}

- (void)setRrule:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ICSProperty *v12;
  ICSProperty *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = [ICSProperty alloc];
        v13 = -[ICSProperty initWithValue:type:](v12, "initWithValue:type:", v11, 5029, (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", v5, CFSTR("RRULE"));
}

- (NSArray)rrule
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RRULE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "value", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setSequence:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5008, CFSTR("SEQUENCE"));

}

- (unint64_t)sequence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("SEQUENCE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("SEQUENCE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (int)status
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("STATUS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "longValue");
  else
    v5 = 0;

  return v5;
}

- (void)setStatus:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSPredefinedValue numberWithLong:](ICSStatusValue, "numberWithLong:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5003, CFSTR("STATUS"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("STATUS"));
  }
}

- (NSString)statusString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("STATUS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "statusString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setStatusString:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    +[ICSStatusValue statusValueFromICSString:](ICSStatusValue, "statusValueFromICSString:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5003, CFSTR("STATUS"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("STATUS"));
  }

}

- (NSArray)relatedTo
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RELATED-TO"));
}

- (void)setRelatedTo:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("RELATED-TO"));
}

- (NSString)summary
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("SUMMARY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setSummary:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("SUMMARY"));
}

- (ICSTrigger)trigger
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TRIGGER"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSTrigger *)v3;
}

- (void)setTrigger:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("TRIGGER"));
}

- (NSString)uid
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("UID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setUid:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("UID"));
}

- (NSURL)url
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("URL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (void)setUrl:(id)a3
{
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", a3, 5013, CFSTR("URL"));
}

- (unint64_t)priority
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PRIORITY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PRIORITY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (void)setPriority:(unint64_t)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5008, CFSTR("PRIORITY"));

}

- (int)x_calendarserver_access
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-CALENDARSERVER-ACCESS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "longValue");
  else
    v5 = 0;

  return v5;
}

- (void)setX_calendarserver_access:(int)a3
{
  id v4;

  if (a3)
  {
    +[ICSPredefinedValue numberWithLong:](ICSCalendarServerAccessValue, "numberWithLong:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5030, CFSTR("X-CALENDARSERVER-ACCESS"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-CALENDARSERVER-ACCESS"));
  }
}

- (NSString)x_apple_dropbox
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-DROPBOX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_dropbox:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-DROPBOX"));
}

- (NSString)x_apple_ews_changekey
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-EWS-CHANGEKEY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_ews_changekey:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-EWS-CHANGEKEY"));
}

- (NSString)x_apple_ews_itemid
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-EWS-ITEMID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_ews_itemid:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-EWS-ITEMID"));
}

- (NSString)x_apple_ews_permission
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-EWS-PERMISSION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_ews_permission:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-EWS-PERMISSION"));
}

- (BOOL)x_apple_ews_needsserverconfirmation
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-EWS-NEEDSSERVERCONFIRMATION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setX_apple_ews_needsserverconfirmation:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("X-APPLE-EWS-NEEDSSERVERCONFIRMATION"));

}

- (void)setX_apple_ignore_on_restore:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("X-APPLE-IGNORE-ON-RESTORE"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-IGNORE-ON-RESTORE"));
  }
}

- (BOOL)x_apple_ignore_on_restore
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-IGNORE-ON-RESTORE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setX_apple_structured_location:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("X-APPLE-STRUCTURED-LOCATION"));
}

- (ICSStructuredLocation)x_apple_structured_location
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-STRUCTURED-LOCATION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSStructuredLocation *)v3;
}

- (void)setX_apple_etag:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-ETAG"));
}

- (NSString)x_apple_etag
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-ETAG"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_scheduletag:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-SCHEDULETAG"));
}

- (NSString)x_apple_scheduletag
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SCHEDULETAG"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_serverFilename:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-SERVERFILENAME"));
}

- (NSString)x_apple_serverFilename
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SERVERFILENAME"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setConferences:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("CONFERENCE"));
}

- (NSArray)conferences
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("CONFERENCE"));
}

- (id)x_apple_travel_duration
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-TRAVEL-DURATION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setX_apple_travel_duration:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("X-APPLE-TRAVEL-DURATION"));
}

- (id)x_apple_travel_advisory_behavior
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-TRAVEL-ADVISORY-BEHAVIOR"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setX_apple_travel_advisory_behavior:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("X-APPLE-TRAVEL-ADVISORY-BEHAVIOR"));
}

- (void)setX_apple_travel_start:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("X-APPLE-TRAVEL-START"));
}

- (id)x_apple_travel_start
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-TRAVEL-START"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setX_apple_end_location:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("X-APPLE-END-LOCATION"));
}

- (id)x_apple_end_location
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-END-LOCATION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)forcedAllDay
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("iCalendar-ForcedAllDay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setForcedAllDay:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("iCalendar-ForcedAllDay"));

}

- (BOOL)x_apple_suggestionInfoChangesAcknowledged
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-CHANGES-ACKNOWLEDGED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setX_apple_suggestionInfoChangesAcknowledged:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("X-APPLE-SUGGESTION-INFO-CHANGES-ACKNOWLEDGED"));

}

- (unint64_t)x_apple_suggestionInfoChangedFields
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-CHANGED-FIELDS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void)setX_apple_suggestionInfoChangedFields:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5008, CFSTR("X-APPLE-SUGGESTION-INFO-CHANGED-FIELDS"));

}

- (NSString)x_apple_suggestionInfoOpaqueKey
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-OPAQUE-KEY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_suggestionInfoOpaqueKey:(id)a3
{
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", a3, 5007, CFSTR("X-APPLE-SUGGESTION-INFO-OPAQUE-KEY"));
}

- (ICSDate)x_apple_suggestionInfoTimestamp
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-TIMESTAMP"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setX_apple_suggestionInfoTimestamp:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("X-APPLE-SUGGESTION-INFO-TIMESTAMP"));
}

- (NSString)x_apple_suggestionInfoUniqueKey
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-UNIQUE-KEY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_suggestionInfoUniqueKey:(id)a3
{
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", a3, 5007, CFSTR("X-APPLE-SUGGESTION-INFO-UNIQUE-KEY"));
}

- (NSString)x_apple_contactIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-CONTACT-IDENTIFIERS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_contactIdentifiers:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-CONTACT-IDENTIFIERS"));
}

- (NSString)x_apple_relatedExternalID
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-EXTERNAL-REFERENCE-ID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_relatedExternalID:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-EXTERNAL-REFERENCE-ID"));
}

- (NSString)x_apple_universalID
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-UNIVERSAL-ID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_universalID:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-UNIVERSAL-ID"));
}

+ (id)inheritanceKeywords
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!_sInheritanceKeywords)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("DTEND"), CFSTR("DTSTART"), CFSTR("DURATION"), CFSTR("EXDATE"), CFSTR("EXRULE"), CFSTR("RDATE"), CFSTR("RRULE"), 0);
    v4 = (void *)_sInheritanceKeywords;
    _sInheritanceKeywords = v3;

  }
  objc_sync_exit(v2);

  return (id)_sInheritanceKeywords;
}

- (void)fixPropertiesInheritance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RECURRENCE-ID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[ICSComponent inheritanceKeywords](ICSComponent, "inheritanceKeywords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(v4, "propertiesForName:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICSComponent propertiesForName:](self, "propertiesForName:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
              -[ICSComponent setProperties:forName:](self, "setProperties:forName:", v13, v12);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
}

- (void)fixAlarms
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  ICSComponent *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = self;
  -[ICSComponent components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = 0x1E9539000uLL;
    v28 = v3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend(v12, "x_wr_alarmuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v3, "containsObject:", v13))
            goto LABEL_8;
          if (objc_msgSend(v12, "action") == 3)
          {
            objc_msgSend(v12, "attendee");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count");

            if (!v16)
            {
LABEL_8:
              -[ICSComponent components](v29, "components", v28);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "removeObject:", v12);

LABEL_24:
              goto LABEL_25;
            }
          }
          else if (objc_msgSend(v12, "action") == 4)
          {
            objc_msgSend(v12, "attach");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {

            }
            else
            {
              objc_msgSend(v12, "bookmark");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v18)
                goto LABEL_8;
            }
          }
          v19 = v5;
          v20 = v9;
          objc_msgSend(v12, "trigger", v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isDurationBased");

          objc_msgSend(v12, "trigger");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v22)
          {
            objc_msgSend(v23, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              -[ICSComponent components](v29, "components");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "removeObject:", v12);

              v9 = v20;
              v5 = v19;
              v3 = v28;
              goto LABEL_24;
            }
          }
          else
          {

            if (v24)
            {
              objc_msgSend(v12, "trigger");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "value");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            }
          }
          objc_msgSend(v12, "fixAlarm");
          v9 = v20;
          v5 = v19;
          v3 = v28;
          if (objc_msgSend(v13, "length"))
            objc_msgSend(v28, "addObject:", v13);
          goto LABEL_24;
        }
LABEL_25:
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

}

- (void)fixRelatedTo
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RELATED-TO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICSComponent relatedTo](self, "relatedTo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[ICSComponent relatedTo](self, "relatedTo", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              -[ICSComponent relatedTo](self, "relatedTo");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "removeObject:", v12);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }

      -[ICSComponent relatedTo](self, "relatedTo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (!v15)
        -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("RELATED-TO"));
    }
    else
    {
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("RELATED-TO"));
    }
  }
}

- (void)fixAttendees
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("ATTENDEE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[ICSComponent attendee](self, "attendee");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    -[ICSComponent attendee](self, "attendee");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "cn");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ <%@>"), v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "containsObject:", v13))
            objc_msgSend(v7, "addIndex:", v8);
          else
            objc_msgSend(v14, "addObject:", v13);

        }
        else
        {
          objc_msgSend(v7, "addIndex:", v8);
        }

        ++v8;
      }
      while (v8 < objc_msgSend(v6, "count"));
    }
    objc_msgSend(v6, "removeObjectsAtIndexes:", v7);
    if (!objc_msgSend(v6, "count"))
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("ATTENDEE"));

  }
}

- (void)fixAttachments
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("ATTACH"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[ICSComponent attach](self, "attach", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[ICSComponent attach](self, "attach");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeObject:", v10);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    -[ICSComponent attach](self, "attach");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("ATTACH"));
  }
}

- (void)fixRecurrenceRules
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RRULE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RRULE"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            -[ICSComponent rrule](self, "rrule");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObject:", v10);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RRULE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("RRULE"));
  }
}

- (void)fixRecurrenceDates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RDATE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[ICSComponent rdate](self, "rdate", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RDATE"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeObject:", v10);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RDATE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("RDATE"));
  }
}

- (void)fixExceptionRules
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXRULE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXRULE"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            -[ICSComponent exrule](self, "exrule");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObject:", v10);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXRULE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("EXRULE"));
  }
}

- (void)fixExceptionDates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXDATE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[ICSComponent exdate](self, "exdate", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXDATE"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeObject:", v10);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXDATE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("EXDATE"));
  }
}

- (void)fixSuggestionInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;

  -[ICSComponent x_apple_suggestionInfoOpaqueKey](self, "x_apple_suggestionInfoOpaqueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[ICSComponent x_apple_suggestionInfoUniqueKey](self, "x_apple_suggestionInfoUniqueKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
      goto LABEL_6;
  }
  else
  {

  }
  -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-CHANGED-FIELDS"));
  -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-CHANGES-ACKNOWLEDGED"));
  -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-OPAQUE-KEY"));
  -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-TIMESTAMP"));
  -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-UNIQUE-KEY"));
LABEL_6:
  -[ICSComponent x_apple_suggestionInfoTimestamp](self, "x_apple_suggestionInfoTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-SUGGESTION-INFO-TIMESTAMP"));
}

- (void)fixComponent
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("UID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICSComponent uid](self, "uid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("UID"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("SUMMARY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICSComponent summary](self, "summary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("SUMMARY"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DESCRIPTION"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICSComponent description](self, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("DESCRIPTION"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("STATUS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("STATUS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("STATUS"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTSTART"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[ICSComponent dtstart](self, "dtstart");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("DTSTART"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("URL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[ICSComponent url](self, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v22 = objc_opt_isKindOfClass();

    if ((v22 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("URL"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("CREATED"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[ICSComponent created](self, "created");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v25 = objc_opt_isKindOfClass();

    if ((v25 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("CREATED"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("LAST-MODIFIED"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[ICSComponent last_modified](self, "last_modified");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("LAST-MODIFIED"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTSTAMP"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[ICSComponent dtstamp](self, "dtstamp");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = objc_opt_isKindOfClass();

    if ((v31 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("DTSTAMP"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("SEQUENCE"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("SEQUENCE"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "value");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = objc_opt_isKindOfClass();

    if ((v36 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("SEQUENCE"));
  }
  -[ICSComponent fixAlarms](self, "fixAlarms");
  -[ICSComponent organizer](self, "organizer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v38 = objc_opt_isKindOfClass();

  if ((v38 & 1) == 0)
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("ORGANIZER"));
    -[ICSComponent organizer](self, "organizer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "fixAddress");

  }
  -[ICSComponent fixAttendees](self, "fixAttendees");
  -[ICSComponent fixAttachments](self, "fixAttachments");
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPSTATUSATTENDEEML"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPSTATUSATTENDEEML"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "value");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = objc_opt_isKindOfClass();

    if ((v44 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-WR-ITIPSTATUSATTENDEEML"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPALREADYSENT"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPALREADYSENT"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "lastObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "value");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = objc_opt_isKindOfClass();

    if ((v49 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-WR-ITIPALREADYSENT"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPSTATUSML"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPSTATUSML"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "lastObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "value");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = objc_opt_isKindOfClass();

    if ((v54 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-WR-ITIPSTATUSML"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RECURRENCE-ID"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[ICSComponent recurrence_id](self, "recurrence_id");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = objc_opt_isKindOfClass();

    if ((v57 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("RECURRENCE-ID"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RECURRENCE-ID"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("EXDATE"));
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("EXRULE"));
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("RDATE"));
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("RRULE"));
  }
  -[ICSComponent fixRelatedTo](self, "fixRelatedTo");
  -[ICSComponent fixRecurrenceRules](self, "fixRecurrenceRules");
  -[ICSComponent fixRecurrenceDates](self, "fixRecurrenceDates");
  -[ICSComponent fixExceptionRules](self, "fixExceptionRules");
  -[ICSComponent fixExceptionDates](self, "fixExceptionDates");
  -[ICSComponent fixSuggestionInfo](self, "fixSuggestionInfo");
}

@end
