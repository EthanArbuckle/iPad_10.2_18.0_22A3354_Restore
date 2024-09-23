@implementation PAAudiogramUtilities

+ ($85CD2974BE96D4886BB301820D1C36C2)entryFromData:(id)a3 atIndex:(unsigned int)a4
{
  $85CD2974BE96D4886BB301820D1C36C2 v5;

  v5 = 0;
  objc_msgSend(a3, "getBytes:range:", &v5, 8 * (a4 + 3) + 12, 8);
  return v5;
}

+ (id)presetFrequencies
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)presetFrequencies_presetFrequencies;
  if (!presetFrequencies_presetFrequencies)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1EA906000, &unk_1EA906010, &unk_1EA906020, &unk_1EA906030, &unk_1EA906040, &unk_1EA906050, &unk_1EA906060, &unk_1EA906070, 0);
    v4 = (void *)presetFrequencies_presetFrequencies;
    presetFrequencies_presetFrequencies = v3;

    v2 = (void *)presetFrequencies_presetFrequencies;
  }
  return v2;
}

+ (id)ptaFrequencies
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)ptaFrequencies_presetFrequencies;
  if (!ptaFrequencies_presetFrequencies)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1EA906010, &unk_1EA906020, &unk_1EA906030, &unk_1EA906050, 0);
    v4 = (void *)ptaFrequencies_presetFrequencies;
    ptaFrequencies_presetFrequencies = v3;

    v2 = (void *)ptaFrequencies_presetFrequencies;
  }
  return v2;
}

+ (id)normalizedOffsetsFromAudiogram:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensitivityPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __55__PAAudiogramUtilities_normalizedOffsetsFromAudiogram___block_invoke;
  v15 = &unk_1EA902638;
  v16 = v5;
  v17 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v12);

  +[PAAudiogramUtilities normalizedOffsetsFromLeftOffsets:andRightOffsets:](PAAudiogramUtilities, "normalizedOffsetsFromLeftOffsets:andRightOffsets:", v9, v8, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __55__PAAudiogramUtilities_normalizedOffsetsFromAudiogram___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = a2;
  objc_msgSend(v3, "frequency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "hertzUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValueForUnit:", v5);
  v7 = v6;

  objc_msgSend(v3, "leftEarSensitivity");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightEarSensitivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getHKUnitClass(), "decibelHearingLevelUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValueForUnit:", v9);
  v11 = v10;

  objc_msgSend(getHKUnitClass(), "decibelHearingLevelUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v12);
  v14 = v13;

  v15 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, v17);

  v18 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, v20);

}

+ (id)normalizedOffsetsFromLeftOffsets:(id)a3 andRightOffsets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  double *v14;
  double v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PAAudiogramUtilities presetFrequencies](PAAudiogramUtilities, "presetFrequencies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke;
  v51[3] = &unk_1EA902660;
  v11 = v8;
  v52 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v51);

  v47 = 0;
  v48 = (double *)&v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0;
  v42[0] = v10;
  v42[1] = 3221225472;
  v42[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_115;
  v42[3] = &unk_1EA902688;
  v42[4] = &v47;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v42);
  v41[0] = v10;
  v41[1] = 3221225472;
  v41[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_2;
  v41[3] = &unk_1EA902688;
  v41[4] = &v43;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v41);
  +[PAAudiogramUtilities ptaFrequencies](PAAudiogramUtilities, "ptaFrequencies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = v48;
  v48[3] = v48[3] / (double)v13;
  v15 = v44[3] / (double)v13;
  v44[3] = v15;
  v16 = v14[3];
  if (vabdd_f64(v16, v15) >= 15.0)
  {
    if (v16 >= v15)
      v18 = v6;
    else
      v18 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v18);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38[0] = v10;
    v38[1] = 3221225472;
    v38[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_3;
    v38[3] = &unk_1EA9026B0;
    v39 = v6;
    v17 = v7;
    v40 = v17;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v38);

    v7 = v39;
  }

  objc_msgSend(v17, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_118);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v10;
  v34[1] = 3221225472;
  v34[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_5;
  v34[3] = &unk_1EA902740;
  v21 = v20;
  v35 = v21;
  v22 = v11;
  v36 = v22;
  v23 = v17;
  v37 = v23;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v34);
  v30[0] = v10;
  v30[1] = 3221225472;
  v30[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_7;
  v30[3] = &unk_1EA902740;
  v24 = v21;
  v31 = v24;
  v25 = v22;
  v32 = v25;
  v26 = v23;
  v33 = v26;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
  v27 = v33;
  v28 = v25;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v28;
}

uint64_t __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", &unk_1EA906080, a2);
}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  double v8;
  id v9;

  v9 = a3;
  v5 = a2;
  +[PAAudiogramUtilities ptaFrequencies](PAAudiogramUtilities, "ptaFrequencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    objc_msgSend(v9, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  }

}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  double v8;
  id v9;

  v9 = a3;
  v5 = a2;
  +[PAAudiogramUtilities ptaFrequencies](PAAudiogramUtilities, "ptaFrequencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    objc_msgSend(v9, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  }

}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKey:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "doubleValue");
  v11 = v10;

  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v9, "numberWithDouble:", v12 * 0.5 + v11 * 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v13, v7);

}

uint64_t __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_5(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v6 = a2;
  if (objc_msgSend(a1[4], "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a1[4];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_6;
    v7[3] = &unk_1EA902718;
    v8 = v6;
    v9 = a1[4];
    v10 = a1[6];
    v11 = a1[5];
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

    v4 = v8;
  }
  else
  {
    v5 = a1[5];
    objc_msgSend(a1[6], "objectForKey:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);
  }

}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v7 = objc_msgSend(v25, "compare:", *(_QWORD *)(a1 + 32));
  if (a3 && v7 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    objc_msgSend(*(id *)(a1 + 32), "floatValue");
    v16 = v15;
    objc_msgSend(v8, "floatValue");
    v18 = v16 - v17;
    objc_msgSend(v25, "floatValue");
    v20 = v19;
    objc_msgSend(v8, "floatValue");
    *(float *)&v22 = (float)(v14 * (float)(1.0 - (float)(v18 / (float)(v20 - v21))))
                   + (float)((float)(v18 / (float)(v20 - v21)) * v11);
    v23 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v24, *(_QWORD *)(a1 + 32));

    *a4 = 1;
  }

}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(a3, "doubleValue");
  if (v5 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v13, "compare:", v6);

    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v10 = *(void **)(a1 + 32);
    if (v7 == 1)
      objc_msgSend(v10, "lastObject");
    else
      objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, v13);

  }
}

+ (id)offsetsSortedByFrequency:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_119);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectsForKeys:notFoundMarker:", v5, &unk_1EA906080);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __49__PAAudiogramUtilities_offsetsSortedByFrequency___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)frequencyDictionaryFromOffsets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  +[PAAudiogramUtilities presetFrequencies](PAAudiogramUtilities, "presetFrequencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  if (v6 == objc_msgSend(v3, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__PAAudiogramUtilities_frequencyDictionaryFromOffsets___block_invoke;
    v8[3] = &unk_1EA902788;
    v9 = v5;
    v10 = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  }
  return v5;
}

void __55__PAAudiogramUtilities_frequencyDictionaryFromOffsets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

}

@end
