@implementation NSCoder(VG)

- (uint64_t)vg_encodeUshort2:()VG forKey:
{
  int v5;

  v5 = a3;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", &v5, 4, a4);
}

- (__n64)vg_decodeUshort2ForKey:()VG
{
  const void *v3;
  size_t v4;
  __n64 result;
  unint64_t v6;
  int __dst;

  __dst = 0;
  v6 = 0;
  v3 = (const void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a3, &v6);
  if (v3)
  {
    if (v6 >= 4)
      v4 = 4;
    else
      v4 = v6;
    memcpy(&__dst, v3, v4);
    result.n64_u16[2] = HIWORD(__dst);
    result.n64_u16[0] = __dst;
  }
  else
  {
    return 0;
  }
  return result;
}

- (uint64_t)vg_encodeUlong4:()VG forKey:
{
  __int128 v4;
  _OWORD v6[2];

  v4 = a3[1];
  v6[0] = *a3;
  v6[1] = v4;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v6, 32, a4);
}

- (void)vg_decodeUlong4ForKey:()VG
{
  void *result;
  size_t v5;
  __int128 v6;
  __int128 v7;
  unint64_t v8;
  __int128 __dst;
  __int128 v10;

  __dst = 0u;
  v10 = 0u;
  v8 = 0;
  result = (void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a2, &v8);
  if (result)
  {
    if (v8 >= 0x20)
      v5 = 32;
    else
      v5 = v8;
    result = memcpy(&__dst, result, v5);
    v7 = __dst;
    v6 = v10;
  }
  else
  {
    v6 = 0uLL;
    v7 = 0uLL;
  }
  *a3 = v7;
  a3[1] = v6;
  return result;
}

- (uint64_t)vg_encodeFloat2:()VG forKey:
{
  double v5;

  v5 = a2;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", &v5, 8, a4);
}

- (double)vg_decodeFloat2ForKey:()VG
{
  double v3;
  const void *v4;
  size_t v5;
  unint64_t v7;
  double __dst;

  v3 = 0.0;
  __dst = 0.0;
  v7 = 0;
  v4 = (const void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a3, &v7);
  if (v4)
  {
    if (v7 >= 8)
      v5 = 8;
    else
      v5 = v7;
    memcpy(&__dst, v4, v5);
    return __dst;
  }
  return v3;
}

- (uint64_t)vg_encodeFloat3:()VG forKey:
{
  __n128 v5;

  v5 = a2;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", &v5, 16, a4);
}

- (double)vg_decodeFloat3ForKey:()VG
{
  const void *v3;
  size_t v4;
  unint64_t v6;
  __int128 __dst;

  __dst = 0uLL;
  v6 = 0;
  v3 = (const void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a3, &v6);
  if (!v3)
    return 0.0;
  if (v6 >= 0x10)
    v4 = 16;
  else
    v4 = v6;
  memcpy(&__dst, v3, v4);
  return *(double *)&__dst;
}

- (uint64_t)vg_encodeFloat4:()VG forKey:
{
  __n128 v5;

  v5 = a2;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", &v5, 16, a4);
}

- (double)vg_decodeFloat4ForKey:()VG
{
  const void *v3;
  double result;
  size_t v5;
  unint64_t v6;
  __int128 __dst;

  __dst = 0u;
  v6 = 0;
  v3 = (const void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a3, &v6);
  result = 0.0;
  if (v3)
  {
    if (v6 >= 0x10)
      v5 = 16;
    else
      v5 = v6;
    memcpy(&__dst, v3, v5);
    return *(double *)&__dst;
  }
  return result;
}

- (uint64_t)vg_encodeFloat4x4:()VG forKey:
{
  _OWORD v8[4];

  v8[0] = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v8, 64, a7);
}

- (double)vg_decodeFloat4x4ForKey:()VG
{
  const void *v3;
  double result;
  size_t v5;
  unint64_t v6;
  _OWORD __dst[4];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(__dst, 0, sizeof(__dst));
  v6 = 0;
  v3 = (const void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a3, &v6);
  result = 0.0;
  if (v3)
  {
    if (v6 >= 0x40)
      v5 = 64;
    else
      v5 = v6;
    memcpy(__dst, v3, v5);
    return *(double *)__dst;
  }
  return result;
}

- (uint64_t)vg_encodeFloat3x3:()VG forKey:
{
  _OWORD v7[3];

  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v7, 48, a6);
}

- (double)vg_decodeFloat3x3ForKey:()VG
{
  const void *v3;
  double result;
  size_t v5;
  unint64_t v6;
  _OWORD __dst[3];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(__dst, 0, sizeof(__dst));
  v6 = 0;
  v3 = (const void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a3, &v6);
  result = 0.0;
  if (v3)
  {
    if (v6 >= 0x30)
      v5 = 48;
    else
      v5 = v6;
    memcpy(__dst, v3, v5);
    return *(double *)__dst;
  }
  return result;
}

- (void)vg_encodeUnsignedInteger:()VG forKey:
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v6, v7);

}

- (uint64_t)vg_decodeUnsignedIntegerForKey:()VG
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (void)vg_encodeUint64:()VG forKey:
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v6, v7);

}

- (uint64_t)vg_decodeUint64ForKey:()VG
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  return v6;
}

- (void)vg_encodeFloat:()VG forKey:
{
  double v6;
  void *v7;
  id v8;

  v8 = a4;
  *(float *)&v6 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v7, v8);

}

- (float)vg_decodeFloatForKey:()VG
{
  id v4;
  void *v5;
  float v6;
  float v7;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (void)vg_encodeSurface:()VG forKey:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "encodeObject:forKey:", v17, v6);
  }
  else if (v17)
  {
    objc_msgSend(v17, "allAttachments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CreationProperties"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v17, "bytesPerRow"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD8E38]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v17, "allocationSize"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD8E18]);

    objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("surfaceProperties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodeObject:forKey:", v9, v12);

    objc_msgSend(v17, "lockWithOptions:seed:", 1, 0);
    v13 = objc_retainAutorelease(v17);
    v14 = objc_msgSend(v13, "baseAddress");
    v15 = objc_msgSend(v13, "allocationSize");
    subkey((NSString *)v6, (objc_selector *)sel_baseAddress);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodeBytes:length:forKey:", v14, v15, v16);

    objc_msgSend(v13, "unlockWithOptions:seed:", 1, 0);
  }

}

- (id)vg_decodeSurfaceForKey:()VG
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodedSurface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(a1, "_vg_decodeSurfaceForKey:", v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v9;

  }
  return v5;
}

- (id)_vg_decodeSurfaceForKey:()VG
{
  NSString *v4;
  id v5;
  void *v6;
  const void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  int64_t v36;
  uint64_t v37;
  size_t v38;
  id v39;
  int64_t v41;
  _QWORD v42[6];
  _QWORD v43[7];

  v43[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v41 = 0;
  v5 = objc_retainAutorelease(a1);
  subkey(v4, (objc_selector *)sel_baseAddress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const void *)objc_msgSend(v5, "decodeBytesForKey:returnedLength:", v6, &v41);

  -[NSString stringByAppendingPathExtension:](v4, "stringByAppendingPathExtension:", CFSTR("surfaceProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "containsValueForKey:", v8);

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathExtension:](v4, "stringByAppendingPathExtension:", CFSTR("surfaceProperties"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_class();
    subkey(v4, (objc_selector *)sel_pixelFormat);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v17, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_11;
    subkey(v4, (objc_selector *)sel_width);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "decodeIntegerForKey:", v19);

    subkey(v4, (objc_selector *)sel_height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v5, "decodeIntegerForKey:", v21);

    subkey(v4, (objc_selector *)sel_bytesPerElement);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v5, "decodeIntegerForKey:", v23);

    subkey(v4, (objc_selector *)sel_bytesPerRow);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v5, "decodeIntegerForKey:", v25);

    v42[0] = *MEMORY[0x24BDD8D90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v15;
    v42[1] = *MEMORY[0x24BDD8D58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v27;
    v42[2] = *MEMORY[0x24BDD8D30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x24BDD8D60];
    v43[2] = v28;
    v43[3] = v14;
    v30 = *MEMORY[0x24BDD8D40];
    v42[3] = v29;
    v42[4] = v30;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v31;
    v42[5] = *MEMORY[0x24BDD8D38];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[5] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8DE8]), "initWithProperties:", v16);
  v14 = v33;
  if (v33)
  {
    objc_msgSend(v33, "lockWithOptions:seed:", 0, 0);
    v34 = objc_retainAutorelease(v14);
    v35 = (void *)objc_msgSend(v34, "baseAddress");
    v36 = v41;
    v37 = objc_msgSend(v34, "allocationSize");
    if (v37 >= v36)
      v38 = v36;
    else
      v38 = v37;
    memcpy(v35, v7, v38);
    objc_msgSend(v34, "unlockWithOptions:seed:", 0, 0);
    v39 = v34;
  }

LABEL_11:
  return v14;
}

- (void)vg_encodeArrayOfSurfaces:()VG forKey:
{
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t i;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_msgSend(v12, "count");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_count"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v7, v8);

  for (i = 0; i < objc_msgSend(v12, "count"); ++i)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_surface_%lu"), v6, i);
    objc_msgSend(v12, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "vg_encodeSurface:forKey:", v11, v10);

  }
}

- (id)vg_decodeArrayOfSurfacesForKey:()VG
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_count"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v6);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_surface_%lu"), v4, i);
      objc_msgSend(a1, "vg_decodeSurfaceForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

    }
  }

  return v7;
}

- (void)vg_encodeDictionaryOfSurfaces:()VG forKey:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = objc_msgSend(v15, "count");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_count"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v7, v8);

  objc_msgSend(v15, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v15, "count"); ++i)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_surface_k_%lu"), v6, i);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_surface_v_%lu"), v6, i);
    objc_msgSend(a1, "encodeObject:forKey:", v11, v13);
    objc_msgSend(a1, "vg_encodeSurface:forKey:", v12, v14);

  }
}

- (id)vg_decodeDictionaryOfSurfacesForKey:()VG
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_count"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v6);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_surface_k_%lu"), v4, i);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_surface_v_%lu"), v4, i);
      objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "vg_decodeSurfaceForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v12, v11);

    }
  }

  return v7;
}

- (void)vg_encodePixelBuffer:()VG forKey:
{
  void *v6;
  id v7;

  v7 = a4;
  CVPixelBufferGetIOSurface(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E18], CFSTR("Only supports IOSurface backed pixel buffers"));
  objc_msgSend(a1, "vg_encodeSurface:forKey:", v6, v7);

}

- (id)vg_decodePixelBufferForKey:()VG
{
  return (id)objc_msgSend(a1, "vg_createDecodedPixelBufferForKey:");
}

- (CVPixelBufferRef)vg_createDecodedPixelBufferForKey:()VG
{
  __IOSurface *v1;
  const __CFDictionary *v2;
  CVPixelBufferRef v3;
  CVPixelBufferRef v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "vg_decodeSurfaceForKey:");
  v1 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = CFSTR("PixelFormatDescription");
  v7[0] = MEMORY[0x24BDBD1B8];
  v2 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], v1, v2, &v5);
  v3 = v5;

  return v3;
}

- (uint64_t)vg_encodeRect:()VG forKey:
{
  _OWORD v8[2];

  a2.n128_f64[1] = a3;
  a4.n128_f64[1] = a5;
  v8[0] = a2;
  v8[1] = a4;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v8, 32, a7);
}

- (__n128)vg_decodeRectForKey:()VG
{
  const void *v3;
  size_t v4;
  unint64_t v6;
  _OWORD __dst[2];

  memset(__dst, 0, sizeof(__dst));
  v6 = 0;
  v3 = (const void *)objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a3, &v6);
  if (v3)
  {
    if (v6 >= 0x20)
      v4 = 32;
    else
      v4 = v6;
    memcpy(__dst, v3, v4);
    return (__n128)__dst[0];
  }
  else
  {
    return (__n128)0;
  }
}

- (void)vg_encodeRasterizationRateMapDescriptor:()VG forKey:
{
  id v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v23 = objc_msgSend(v6, "layerCount");
  subkey(v7, (objc_selector *)sel_layerCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v23, v8);

  if (v6)
  {
    objc_msgSend(v6, "screenSize");
    v9 = v24;
  }
  else
  {
    v9 = 0;
    v24 = 0;
    v25 = 0;
  }
  subkey(v7, (objc_selector *)sel_width);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v9, v10);

  if (v6)
  {
    objc_msgSend(v6, "screenSize");
    v11 = v25;
  }
  else
  {
    v11 = 0;
    v24 = 0;
    v25 = 0;
  }
  subkey(v7, (objc_selector *)sel_height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vg_encodeUnsignedInteger:forKey:", v11, v12);

  if (v23)
  {
    for (i = 0; i != v23; ++i)
    {
      v14 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_layer_%lu"), v7, i);
      objc_msgSend(v6, "layers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "horizontalSampleStorage");
      if (v16)
      {
        objc_msgSend(v16, "sampleCount");
        v18 = v24;
      }
      else
      {
        v18 = 0;
        v24 = 0;
        v25 = 0;
      }
      subkey(v14, (objc_selector *)sel_horizontalSampleStorage);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodeBytes:length:forKey:", v17, 4 * v18, v19);

      v20 = objc_msgSend(v16, "verticalSampleStorage");
      if (v16)
      {
        objc_msgSend(v16, "sampleCount");
        v21 = v25;
      }
      else
      {
        v21 = 0;
        v24 = 0;
        v25 = 0;
      }
      subkey(v14, (objc_selector *)sel_verticalSampleStorage);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodeBytes:length:forKey:", v20, 4 * v21, v22);

    }
  }

}

- (id)vg_decodeRasterizationRateMapDescriptorForKey:()VG
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t i;
  NSString *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSString *v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];

  v22 = a3;
  subkey(v22, (objc_selector *)sel_layerCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v4);

  subkey(v22, (objc_selector *)sel_width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v6);

  subkey(v22, (objc_selector *)sel_height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "vg_decodeUnsignedIntegerForKey:", v8);

  v10 = objc_alloc_init(MEMORY[0x24BDDD678]);
  v26[0] = v7;
  v26[1] = v9;
  v26[2] = 1;
  objc_msgSend(v10, "setScreenSize:", v26);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      v12 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_layer_%lu"), v22, i);
      v24 = 0;
      v25 = 0;
      v13 = objc_retainAutorelease(a1);
      subkey(v12, (objc_selector *)sel_horizontalSampleStorage);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "decodeBytesForKey:returnedLength:", v14, &v25);

      v16 = objc_retainAutorelease(v13);
      subkey(v12, (objc_selector *)sel_verticalSampleStorage);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "decodeBytesForKey:returnedLength:", v17, &v24);

      v19 = objc_alloc(MEMORY[0x24BDDD660]);
      v23[0] = v25;
      v23[1] = v24;
      v23[2] = 0;
      v20 = (void *)objc_msgSend(v19, "initWithSampleCount:horizontal:vertical:", v23, v15, v18);
      objc_msgSend(v10, "setLayer:atIndex:", v20, i);

    }
  }

  return v10;
}

- (uint64_t)vg_encodeViewport:()VG forKey:
{
  return objc_msgSend(a1, "encodeBytes:length:forKey:", a3, 48, a4);
}

- (__n128)vg_decodeViewportForKey:()VG
{
  uint64_t v4;
  __int128 v5;
  __n128 result;
  uint64_t v7;

  v7 = 0;
  v4 = objc_msgSend(objc_retainAutorelease(a1), "decodeBytesForKey:returnedLength:", a2, &v7);
  v5 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)a3 = *(_OWORD *)v4;
  *(_OWORD *)(a3 + 16) = v5;
  result = *(__n128 *)(v4 + 32);
  *(__n128 *)(a3 + 32) = result;
  return result;
}

@end
