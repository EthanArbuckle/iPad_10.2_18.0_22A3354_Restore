@implementation NSCoder(_DUIVisibleDroppedItemVectorCoding)

- (void)_uikit_encodeSPVector3D:()_DUIVisibleDroppedItemVectorCoding forKey:
{
  void *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = *a3;
  v8 = a4;
  objc_msgSend(v6, "numberWithDouble:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[1], v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[2]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v12, v8);

}

- (void)_uikit_decodeSPVector3DForKey:()_DUIVisibleDroppedItemVectorCoding
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v16;
  if (v16 && (v7 = objc_msgSend(v16, "count") == 3, v6 = v16, v7))
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    *a3 = v10;
    a3[1] = v13;
    a3[2] = v15;
    a3[3] = 0;

    v6 = v16;
  }
  else
  {
    *(_OWORD *)a3 = 0u;
    *((_OWORD *)a3 + 1) = 0u;
  }

}

@end
