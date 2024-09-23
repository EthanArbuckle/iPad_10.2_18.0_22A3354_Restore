@implementation APOdmlPFLUtilities

+ (float)convertToFloat:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  float *v9;
  unint64_t i;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;

  v3 = a3;
  v6 = objc_msgSend_count(v3, v4, v5);
  v9 = (float *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  for (i = 0; i < objc_msgSend_count(v3, v7, v8); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3, v11, i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v12, v13, v14);
    v9[i] = v15;

  }
  return v9;
}

+ (id)convertToArray:(float *)a3 count:(unint64_t)a4
{
  float *v5;
  const char *v6;
  uint64_t v7;
  void *i;
  double v9;
  void *v10;
  const char *v11;

  v5 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; --a4)
  {
    *(float *)&v9 = *v5;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(i, v11, (uint64_t)v10);

    ++v5;
  }
  return i;
}

+ (id)keyForTypes:(id)a3 placementType:(unint64_t)a4 assetManagerType:(unint64_t)a5
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v7, v8, (uint64_t)CFSTR("_"));
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("%lu"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v7, v11, (uint64_t)v10);

  objc_msgSend_appendString_(v7, v12, (uint64_t)CFSTR("_"));
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("%lu"), a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v7, v15, (uint64_t)v14);

  v18 = (void *)objc_msgSend_copy(v7, v16, v17);
  return v18;
}

+ (id)pluginStringForPlacementType:(unint64_t)a3
{
  __CFString **v3;

  v3 = kAPOdmlDESPluginSLPPluginName;
  if (!a3)
    v3 = kAPOdmlDESPluginSRPPluginName;
  return *v3;
}

@end
