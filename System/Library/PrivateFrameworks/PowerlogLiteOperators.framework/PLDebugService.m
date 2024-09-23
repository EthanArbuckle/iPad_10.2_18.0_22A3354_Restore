@implementation PLDebugService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLDebugService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Test");
  objc_msgSend(a1, "entryEventPointDefinitionTest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointDefinitionTest
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v16[0] = *MEMORY[0x1E0D80318];
  v16[1] = v2;
  v17[0] = &unk_1E8653760;
  v17[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("StringKey1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("StringKey2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = CFSTR("DefaultKey1");
  v12 = *MEMORY[0x1E0D80358];
  v13 = &unk_1E8634B30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("AggregateTest");
  objc_msgSend(a1, "entryAggregateDefinitionAggregateTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("AggregateTestSmall");
  objc_msgSend(a1, "entryAggregateDefinitionAggregateTestSmall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("AggregateTestVerySmall");
  objc_msgSend(a1, "entryAggregateDefinitionAggregateTestVerySmall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("AggregateTestSplitAndBucket");
  objc_msgSend(a1, "entryAggregateDefinitionAggregateTestSplitAndBucket");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryAggregateDefinitionAggregateTest
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[2];
  uint64_t v42;
  _QWORD v43[3];
  _QWORD v44[8];
  _QWORD v45[8];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x1E0C80C00];
  v48[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v46[0] = *MEMORY[0x1E0D80318];
  v46[1] = v2;
  v47[0] = &unk_1E8653770;
  v47[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v28;
  v48[1] = *MEMORY[0x1E0D802F0];
  v44[0] = CFSTR("PrimaryKey1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v26;
  v44[1] = CFSTR("PrimaryKey2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_StringFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v24;
  v44[2] = CFSTR("SumField");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v22;
  v44[3] = CFSTR("SumField2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v20;
  v44[4] = CFSTR("MinField");
  v4 = *MEMORY[0x1E0D802E0];
  v41[0] = *MEMORY[0x1E0D80358];
  v3 = v41[0];
  v41[1] = v4;
  v5 = MEMORY[0x1E0C9AAB0];
  v43[0] = &unk_1E8634B48;
  v43[1] = MEMORY[0x1E0C9AAB0];
  v42 = *MEMORY[0x1E0D80230];
  v6 = v42;
  v43[2] = &unk_1E8634B60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v41, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v19;
  v44[5] = CFSTR("AverageField");
  v39[0] = v3;
  v39[1] = v4;
  v40[0] = &unk_1E8634B48;
  v40[1] = v5;
  v39[2] = v6;
  v40[2] = &unk_1E8634B78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v7;
  v44[6] = CFSTR("MaxField");
  v37[0] = v3;
  v37[1] = v4;
  v38[0] = &unk_1E8634B48;
  v38[1] = v5;
  v37[2] = v6;
  v38[2] = &unk_1E8634B90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v8;
  v44[7] = CFSTR("NumericalField");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v11;
  v48[2] = *MEMORY[0x1E0D80228];
  v35[0] = &unk_1E8653780;
  v33 = *MEMORY[0x1E0D80220];
  v12 = v33;
  v34 = &unk_1E8653790;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v13;
  v35[1] = &unk_1E8653790;
  v31 = v12;
  v32 = &unk_1E86537A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v14;
  v35[2] = &unk_1E86537A0;
  v29 = v12;
  v30 = &unk_1E86537B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = *MEMORY[0x1E0D80238];
  v49[2] = v16;
  v49[3] = &unk_1E8652400;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)entryAggregateDefinitionAggregateTestSmall
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[6];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1E86537C0;
  v24[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("PrimaryKey1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v21[1] = CFSTR("PrimaryKey2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v4;
  v21[2] = CFSTR("SumField");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v6;
  v21[3] = CFSTR("SumField2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  v25[2] = *MEMORY[0x1E0D80228];
  v19 = &unk_1E86537D0;
  v17 = *MEMORY[0x1E0D80220];
  v18 = &unk_1E8653790;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = *MEMORY[0x1E0D80238];
  v26[2] = v11;
  v26[3] = &unk_1E8652418;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryAggregateDefinitionAggregateTestVerySmall
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653760;
  v20[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("PrimaryKey1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("SumField");
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  v21[2] = *MEMORY[0x1E0D80228];
  v15 = &unk_1E86537D0;
  v13 = *MEMORY[0x1E0D80220];
  v14 = &unk_1E8653790;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = *MEMORY[0x1E0D80238];
  v22[2] = v10;
  v22[3] = &unk_1E8652430;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryAggregateDefinitionAggregateTestSplitAndBucket
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[4];
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v28[0] = *MEMORY[0x1E0D80318];
  v28[1] = v2;
  v29[0] = &unk_1E8653760;
  v29[1] = MEMORY[0x1E0C9AAA0];
  v28[2] = *MEMORY[0x1E0D80240];
  v29[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v17;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("PrimaryKey1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v26[1] = CFSTR("SumField");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v4;
  v26[2] = CFSTR("SumField2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v7;
  v30[2] = *MEMORY[0x1E0D80228];
  v24[0] = &unk_1E86537D0;
  v22 = *MEMORY[0x1E0D80220];
  v8 = v22;
  v23 = &unk_1E8653790;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v24[1] = &unk_1E8653790;
  v20 = v8;
  v21 = &unk_1E8653790;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  v24[2] = &unk_1E86537A0;
  v18 = v8;
  v19 = &unk_1E8653790;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = *MEMORY[0x1E0D80238];
  v31[2] = v12;
  v31[3] = &unk_1E8652448;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventNoneDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("PLAPITest");
  objc_msgSend(a1, "entryEventNoneDefinitionPLAPITest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("ArrayTest");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventNoneDefinitionArrayTest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventNoneDefinitionPLAPITest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E86537E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("entry1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("entry2");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventNoneDefinitionArrayTest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];
  _QWORD v21[4];
  uint64_t v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[5];

  v25[3] = *MEMORY[0x1E0C80C00];
  v24[0] = *MEMORY[0x1E0D80298];
  v22 = *MEMORY[0x1E0D80318];
  v23 = &unk_1E8653760;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v24[1] = *MEMORY[0x1E0D802F0];
  v20[0] = CFSTR("RandomString");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  v20[1] = CFSTR("RandomNumber");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  v20[2] = CFSTR("StaticArrayType");
  v7 = *MEMORY[0x1E0D80348];
  v17[0] = *MEMORY[0x1E0D80358];
  v6 = v17[0];
  v17[1] = v7;
  v19[0] = &unk_1E8634BA8;
  v19[1] = &unk_1E8634BC0;
  v18 = *MEMORY[0x1E0D80350];
  v8 = v18;
  v19[2] = &unk_1E8634BD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v17, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  v20[3] = CFSTR("DynamicArrayType");
  v15[0] = v6;
  v15[1] = v8;
  v16[0] = &unk_1E8634BA8;
  v16[1] = &unk_1E8634BD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = *MEMORY[0x1E0D80260];
  v25[1] = v11;
  v25[2] = &unk_1E8652460;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitionSleepNotificationTest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1E8653760;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("NotificationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("Listener");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("FiredTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_DateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventNoneDefinitionFastInsertTest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653760;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("iteration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PLDebugService)init
{
  unint64_t v3;
  PLDebugService *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  __CFNotificationCenter *v10;
  __CFNotificationCenter *v11;
  __CFNotificationCenter *v12;
  __CFNotificationCenter *v13;
  __CFNotificationCenter *v14;
  __CFNotificationCenter *v15;
  __CFNotificationCenter *v16;
  __CFNotificationCenter *v17;
  __CFNotificationCenter *v18;
  __CFNotificationCenter *v19;
  __CFNotificationCenter *v20;
  __CFNotificationCenter *v21;
  __CFNotificationCenter *v22;
  __CFNotificationCenter *v23;
  __CFNotificationCenter *v24;
  __CFNotificationCenter *v25;
  __CFNotificationCenter *v26;
  __CFNotificationCenter *v27;
  __CFNotificationCenter *v28;
  __CFNotificationCenter *v29;
  __CFNotificationCenter *v30;
  __CFNotificationCenter *v31;
  __CFNotificationCenter *v32;
  __CFNotificationCenter *v33;
  __CFNotificationCenter *v34;
  __CFNotificationCenter *v35;
  __CFNotificationCenter *v36;
  __CFNotificationCenter *v37;
  __CFNotificationCenter *v38;
  __CFNotificationCenter *v39;
  __CFNotificationCenter *v40;
  __CFNotificationCenter *v41;
  __CFNotificationCenter *v42;
  __CFNotificationCenter *v43;
  __CFNotificationCenter *v44;
  __CFNotificationCenter *v45;
  __CFNotificationCenter *v46;
  __CFNotificationCenter *v47;
  __CFNotificationCenter *v48;
  __CFNotificationCenter *v49;
  __CFNotificationCenter *v50;
  __CFNotificationCenter *v51;
  __CFNotificationCenter *v52;
  __CFNotificationCenter *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  unint64_t v61;
  void (*v62)(uint64_t, void *, void *);
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __CFString *v69;
  uint64_t v70;
  void (*v71)(uint64_t, void *, void *);
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  __CFNotificationCenter *v79;
  PLDebugService *v80;
  id obj;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  PLDebugService *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  _QWORD block[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  objc_super v99;
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0D7F000uLL;
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("PLDebugService_Enabled"), 0) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v99.receiver = self;
    v99.super_class = (Class)PLDebugService;
    v4 = -[PLOperator init](&v99, sel_init);
    if (v4)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testMonotonicAggregateEntries"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v6 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v6, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testMonotonicAggregateEntriesExtendedTime"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v7 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v7, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testProportionateAggregateEntries"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v8 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v8, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testEntryQueries"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v9 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v9, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testEntryDelete"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v10 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v10, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testEntryApplicationAgent"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v11 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v11, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testEntrySleep"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v12 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v12, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testEntryWake"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v13 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v13, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testAllEntryKeyRequests"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v14 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v14, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testFastInserts"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v15 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v15, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.ABM"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v16 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v16, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.TestArrays"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v17 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v17, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.generateOTASubmission"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v18 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v18, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.generateSafeguardSubmission"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v19 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v19, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.scheduleSafeguardSubmission"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v20 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v20, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressTaskingSubmission"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v21 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v21, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.dailyTasks"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v22 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v22, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.archive"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v23 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v23, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.trimEPSQL"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v24 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v24, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.trimCESQL"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v25 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v25, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.trimXCSQL"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v26 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v26, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.logSizeOfStagingEntryCache"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v27 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v27, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.dumpStagingEntryCache"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v28 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v28, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stresstimer"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v29 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v29, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressplentry"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v30 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v30, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stresscache"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v31 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v31, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stresscachesmall"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v32 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v32, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressObjectForKey"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v33 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v33, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressSetObjectForKey"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v34 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v34, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressActivityScheduler"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v35 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v35, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressMidnightCalculation"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v36 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v36, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressMonotonicTimer"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v37 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v37, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressMonotonicTimer2"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v38 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v38, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressMonotonicTimer3"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v39 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v39, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testMonotonicTimerThroughSleep"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v40 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v40, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.currentBasebandTime"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v41 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v41, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testExit"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v42 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v42, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testQuarantineExit"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v43 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v43, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressAggregateSmall"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v44 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v44, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.stressAggregateVerySmall"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v45 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v45, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testUTF8"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v46 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v46, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testCompression"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v47 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v47, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.testBlockingFlushCaches"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v48 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v48, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.fireSBC"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v49 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v49, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.aggregateDataFromSignpost"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v50 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v50, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.appIdentifierTables"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v51 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v51, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.appIdentifierColumns"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v52 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v52, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.DMATables"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v53 = CFNotificationCenterGetDarwinNotifyCenter();
      v86 = v4;
      CFNotificationCenterAddObserver(v53, v4, (CFNotificationCallback)TestEntryQueriesRequested, CFSTR("com.apple.powerlogd.trimQueries"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      objc_msgSend(MEMORY[0x1E0D7FF88], "registeredOperators");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("allAgentClasses=%@"), v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "lastPathComponent");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService init]");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 386);

      PLLogCommon();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v103 = v55;
        _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      obj = v54;
      v4 = v86;
      v61 = 0x1E0CB3000uLL;
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
      if (v84)
      {
        v83 = *(_QWORD *)v96;
        v62 = TestEntryLogRequested;
        do
        {
          v63 = 0;
          do
          {
            if (*(_QWORD *)v96 != v83)
              objc_enumerationMutation(obj);
            v85 = v63;
            v64 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v63);
            v91 = 0u;
            v92 = 0u;
            v93 = 0u;
            v94 = 0u;
            objc_msgSend(v64, "entryKeys");
            v89 = (id)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
            if (v65)
            {
              v66 = v65;
              v67 = *(_QWORD *)v92;
              v87 = *(_QWORD *)v92;
              do
              {
                v68 = 0;
                v88 = v66;
                do
                {
                  if (*(_QWORD *)v92 != v67)
                    objc_enumerationMutation(v89);
                  objc_msgSend(*(id *)(v61 + 2368), "stringWithFormat:", CFSTR("com.apple.powerlogd.testEntryLog.%@"), *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v68));
                  v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(*(id *)(v3 + 4000), "debugEnabled"))
                  {
                    v70 = objc_opt_class();
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __22__PLDebugService_init__block_invoke;
                    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                    block[4] = v70;
                    if (qword_1ED885310 != -1)
                      dispatch_once(&qword_1ED885310, block);
                    if (_MergedGlobals_1_58)
                    {
                      v71 = v62;
                      v72 = v3;
                      objc_msgSend(*(id *)(v61 + 2368), "stringWithFormat:", CFSTR("signing up for notification %@"), v69);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      v74 = (void *)MEMORY[0x1E0D7FF98];
                      objc_msgSend(*(id *)(v61 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "lastPathComponent");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(v61 + 2368), "stringWithUTF8String:", "-[PLDebugService init]");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "logMessage:fromFile:fromFunction:fromLineNumber:", v73, v76, v77, 390);

                      PLLogCommon();
                      v78 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v103 = v73;
                        _os_log_debug_impl(&dword_1CAF47000, v78, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      v3 = v72;
                      v61 = 0x1E0CB3000;
                      v62 = v71;
                      v4 = v86;
                      v67 = v87;
                      v66 = v88;
                    }
                  }
                  v79 = CFNotificationCenterGetDarwinNotifyCenter();
                  CFNotificationCenterAddObserver(v79, v4, (CFNotificationCallback)v62, v69, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

                  ++v68;
                }
                while (v66 != v68);
                v66 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
              }
              while (v66);
            }

            v63 = v85 + 1;
          }
          while (v85 + 1 != v84);
          v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
        }
        while (v84);
      }

    }
    self = v4;
    v80 = self;
  }
  else
  {
    v80 = 0;
  }

  return v80;
}

uint64_t __22__PLDebugService_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_58 = result;
  return result;
}

- (void)printNullTestResultsForEntry:(id)a3 withDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37A0];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:\n***\n"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RandomString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("RandomString=%@\n"), v8);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RandomString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("RandomString.class=%@\n"), objc_opt_class());

  objc_msgSend(v6, "keys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("allKeys=%@\n"), v10);

  objc_msgSend(v6, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("allValues=%@\n"), v11);

  objc_msgSend(v6, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("dictionary=%@\n"), v12);

  objc_msgSend(v7, "appendFormat:", CFSTR("entry=%@\n"), v6);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RandomString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v7, "appendString:", CFSTR("\n!!!!!!!!!!!!!!!!!This should not log!!!!!!!!!!!!!!!!!!!!!!!!!\n"));
  objc_msgSend(v7, "appendString:", CFSTR(" \n***\n\n\n"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService printNullTestResultsForEntry:withDescription:]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 413);

  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v14;
    _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)initOperatorDependancies
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  __CFString *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  uint8_t buf[4];
  const __CFString *v76;
  __int16 v77;
  const __CFString *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("NULLTest")))
  {
    +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("ArrayTest"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("RandomString"));
    -[PLDebugService printNullTestResultsForEntry:withDescription:](self, "printNullTestResultsForEntry:withDescription:", v4, CFSTR("nilSetEntry"));
    -[PLOperator logEntry:](self, "logEntry:", v4);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("RandomString"));

    -[PLDebugService printNullTestResultsForEntry:withDescription:](self, "printNullTestResultsForEntry:withDescription:", v5, CFSTR("nsnullSetEntry"));
    -[PLOperator logEntry:](self, "logEntry:", v5);
    v59 = (void *)v3;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
    -[PLDebugService printNullTestResultsForEntry:withDescription:](self, "printNullTestResultsForEntry:withDescription:", v7, CFSTR("notSetEntry"));
    -[PLOperator logEntry:](self, "logEntry:", v7);
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("nil=%@ nil.class=%@ NSNull=%@ NSNull.class=%@"), 0, v9, v10, objc_opt_class());
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 435);

    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v12;
      _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Null test done"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 436);

    PLLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v18;
      _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D908, &__block_literal_global_46);
  -[PLDebugService setXpcListenerPLLog:](self, "setXpcListenerPLLog:", v24);
  v25 = objc_alloc(MEMORY[0x1E0D80090]);
  v26 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_255;
  v74[3] = &unk_1E8578610;
  v74[4] = self;
  v60 = (void *)objc_msgSend(v25, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D930, v74);
  -[PLDebugService setAggregateTestListener:](self, "setAggregateTestListener:");
  v73[0] = v26;
  v73[1] = 3221225472;
  v73[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_2;
  v73[3] = &unk_1E8577F70;
  v73[4] = self;
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D958, v73);
  -[PLDebugService setAggregateTestResponder:](self, "setAggregateTestResponder:");
  v72[0] = v26;
  v72[1] = 3221225472;
  v72[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_282;
  v72[3] = &unk_1E8578610;
  v72[4] = self;
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D980, v72);
  -[PLDebugService setSchemaTestListener:](self, "setSchemaTestListener:");
  if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("PowerAssertion")))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:forUpdateOrInsert:withBlock:", self, CFSTR("PLPowerAssertionAgent_EventInterval_Assertion"), 2, &__block_literal_global_299);
    -[PLDebugService setAssertionListener:](self, "setAssertionListener:", v27);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:forUpdateOrInsert:withBlock:", self, CFSTR("PLPowerAssertionAgent_EventInterval_Assertion"), 1, &__block_literal_global_303);
    -[PLDebugService setAssertionNewListener:](self, "setAssertionNewListener:", v28);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:forUpdateOrInsert:withBlock:", self, CFSTR("PLPowerAssertionAgent_EventInterval_Assertion"), 0, &__block_literal_global_307);
    -[PLDebugService setAssertionUpdateListener:](self, "setAssertionUpdateListener:", v29);

  }
  if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("SleepNotification")))
  {
    v56 = v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setup SleepNotification test!"));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 532);

    PLLogCommon();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v30;
      _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v71[0] = v26;
    v71[1] = 3221225472;
    v71[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_314;
    v71[3] = &unk_1E8577F48;
    v71[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "sleepEntryNotificationWithOperator:withBlock:", self, v71);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDebugService setSleepNotification:](self, "setSleepNotification:", v36);
    objc_msgSend(MEMORY[0x1E0D80030], "sharedSemaphoreForKey:", *MEMORY[0x1E0D80218]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDebugService setCanSleepSemaphore:](self, "setCanSleepSemaphore:", v37);

    -[PLDebugService canSleepSemaphore](self, "canSleepSemaphore");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "signalInterestByObject:", self);

    v70[0] = v26;
    v70[1] = 3221225472;
    v70[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_326;
    v70[3] = &unk_1E8577F48;
    v70[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "canSleepEntryNotificationWithOperator:withBlock:", self, v70);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDebugService setCanSleepNotification:](self, "setCanSleepNotification:", v39);
    v69[0] = v26;
    v69[1] = 3221225472;
    v69[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_331;
    v69[3] = &unk_1E8577F48;
    v69[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "wakeEntryNotificationWithOperator:withBlock:", self, v69);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDebugService setWakeNotification:](self, "setWakeNotification:", v40);

    v24 = v56;
  }
  v41 = objc_alloc(MEMORY[0x1E0D80098]);
  dispatch_get_global_queue(-32768, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v26;
  v68[1] = 3221225472;
  v68[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_341;
  v68[3] = &unk_1E8577F70;
  v68[4] = self;
  v43 = (void *)objc_msgSend(v41, "initWithWorkQueue:withRegistration:withBlock:", v42, &unk_1E864D9A8, v68);

  -[PLDebugService setXpcResponderPLAPITest:](self, "setXpcResponderPLAPITest:", v43);
  v67[0] = v26;
  v67[1] = 3221225472;
  v67[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_422;
  v67[3] = &unk_1E8578610;
  v67[4] = self;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D9D0, v67);
  -[PLDebugService setClientFrameworkTestListener:](self, "setClientFrameworkTestListener:", v44);

  v66[0] = v26;
  v66[1] = 3221225472;
  v66[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_2_426;
  v66[3] = &unk_1E8577F70;
  v66[4] = self;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D9F8, v66);
  -[PLDebugService setClientFrameworkTestResponder:](self, "setClientFrameworkTestResponder:", v45);

  v65[0] = v26;
  v65[1] = 3221225472;
  v65[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_3;
  v65[3] = &unk_1E8578610;
  v65[4] = self;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864DA20, v65);
  -[PLDebugService setClientFrameworkTestListenerNonAllowlisted:](self, "setClientFrameworkTestListenerNonAllowlisted:", v46);

  v64[0] = v26;
  v64[1] = 3221225472;
  v64[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_4;
  v64[3] = &unk_1E8577F70;
  v64[4] = self;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864DA48, v64);
  -[PLDebugService setClientFrameworkTestResponderNonAllowlisted:](self, "setClientFrameworkTestResponderNonAllowlisted:", v47);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDebugService setClientFrameworkTestDataBatch:](self, "setClientFrameworkTestDataBatch:", v48);

  v63[0] = v26;
  v63[1] = 3221225472;
  v63[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_5;
  v63[3] = &unk_1E8578610;
  v63[4] = self;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864DA70, v63);
  -[PLDebugService setClientFrameworkTestListenerBatch:](self, "setClientFrameworkTestListenerBatch:", v49);

  v62[0] = v26;
  v62[1] = 3221225472;
  v62[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_6;
  v62[3] = &unk_1E8577F70;
  v62[4] = self;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864DA98, v62);
  -[PLDebugService setClientFrameworkTestResponderBatch:](self, "setClientFrameworkTestResponderBatch:", v50);

  if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("EnergyMonitorDebug")))
  {
    PLLogCommon();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v76 = CFSTR("/tmp/energy_monitor_debug_config.plist");
      _os_log_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_INFO, "EnergyMonitor Debug mode enabled, reading from plist at %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/tmp/energy_monitor_debug_config.plist"));
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v52;
      _os_log_impl(&dword_1CAF47000, v53, OS_LOG_TYPE_INFO, "mockData=%@", buf, 0xCu);
    }

    if (v52)
    {
      v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FDD8]), "initWithDebugMode:andMockData:andCompletionBlock:", 1, v52, &__block_literal_global_454_0);
      -[PLDebugService setEnergyMonitorDebugInstance:](self, "setEnergyMonitorDebugInstance:", v54);
    }
    else
    {
      PLLogCommon();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v76 = 0;
        v77 = 2112;
        v78 = CFSTR("/tmp/energy_monitor_debug_config.plist");
        _os_log_error_impl(&dword_1CAF47000, v54, OS_LOG_TYPE_ERROR, "error: mockData=%@ at path=%@", buf, 0x16u);
      }
    }

  }
  v61[0] = v26;
  v61[1] = 3221225472;
  v61[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_458;
  v61[3] = &unk_1E8577F70;
  v61[4] = self;
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864DAC0, v61);
  -[PLDebugService setEnergyMonitorDebugResponder:](self, "setEnergyMonitorDebugResponder:", v55);

}

void __42__PLDebugService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got callback! %@"), a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 440);

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

void __42__PLDebugService_initOperatorDependancies__block_invoke_255(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v6 = *MEMORY[0x1E0D80368];
  v7 = a5;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", v6, CFSTR("AggregateTest"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v26);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PrimaryKey1"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("PrimaryKey1"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PrimaryKey2"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("PrimaryKey2"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SumField"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("SumField"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SumField2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("SumField2"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AverageField"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("AverageField"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxField"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  objc_msgSend(v20, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("MaxField"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MinField"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "doubleValue");
  objc_msgSend(v23, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("MinField"));

  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v8);
}

id __42__PLDebugService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AggregateTest"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bucketLength"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("location"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  v49 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("length"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v7;
  objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v7, v10, v13, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v55;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v24), "serializedForJSON");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v22);
  }

  objc_msgSend(MEMORY[0x1E0D7FFB0], "summarizeAggregateEntries:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v28 = v26;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v51;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v51 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v32), "serializedForJSON");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v30);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("summarizedEntries=%@"), v28);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "lastPathComponent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke_2");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 479);

  PLLogCommon();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v34;
    _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resultEntries=%@"), v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "lastPathComponent");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 480);

  PLLogCommon();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v40;
    _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v58[0] = CFSTR("results");
  v58[1] = CFSTR("summarizedResults");
  v59[0] = v19;
  v59[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_282(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v47 = v6;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v55;
    v40 = *MEMORY[0x1E0D80388];
    v41 = *(_QWORD *)v55;
    do
    {
      v11 = 0;
      v42 = v9;
      do
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("count")) & 1) == 0)
        {
          v46 = v11;
          +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", v40, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D7FFB8], "definitionForEntryKey:", v13);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logging entryKey %@ with definition %@"), v13, v45);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)v14;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v17, v19, 492);

          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v18;
            _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v21 = (void *)objc_opt_new();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v13);

          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v44 = v12;
          objc_msgSend(v47, "objectForKeyedSubscript:", v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v51;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v51 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
                v48[0] = MEMORY[0x1E0C809B0];
                v48[1] = 3221225472;
                v48[2] = __42__PLDebugService_initOperatorDependancies__block_invoke_288;
                v48[3] = &unk_1E857DCD8;
                v49 = v28;
                v29 = v28;
                objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v48);
                objc_msgSend(v7, "objectForKeyedSubscript:", v13);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v29);

                objc_msgSend(*(id *)(a1 + 32), "logEntry:", v29);
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            }
            while (v24);
          }

          v31 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v47, "objectForKeyedSubscript:", v44);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("payload[%@]=%@ entries[%@]=%@"), v44, v32, v13, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "lastPathComponent");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke_2");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 506);

          PLLogCommon();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v34;
            _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v10 = v41;
          v9 = v42;
          v11 = v46;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v9);
  }

}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_297(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AssertionListener callback: name=%@ userInfo=%@"), a3, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 516);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

void __42__PLDebugService_initOperatorDependancies__block_invoke_302(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AssertionNewListener callback: name=%@ userInfo=%@"), a3, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 521);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

void __42__PLDebugService_initOperatorDependancies__block_invoke_306(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AssertionUpdateListener callback: name=%@ userInfo=%@"), a3, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 526);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

void __42__PLDebugService_initOperatorDependancies__block_invoke_314(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sleepListener block: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 534);

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("SleepNotificationTest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("NotificationType"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("sleepListener"), CFSTR("Listener"));
  objc_msgSend(v11, "entryDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("FiredTimestamp"));

  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v13);
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_326(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("canSleepListener block: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 549);

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("SleepNotificationTest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("NotificationType"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("canSleepListener"), CFSTR("Listener"));
  objc_msgSend(v11, "entryDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("FiredTimestamp"));

  objc_msgSend(*(id *)(a1 + 32), "canSleepSemaphore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "signalDoneByObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v13);
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_331(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("wakeListener block: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService initOperatorDependancies]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 562);

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("SleepNotificationTest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("NotificationType"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("wakeListener"), CFSTR("Listener"));
  objc_msgSend(v11, "entryDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("FiredTimestamp"));

  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v13);
}

id __42__PLDebugService_initOperatorDependancies__block_invoke_341(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testBucket"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "mutableCopy");

  v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("pass"));

  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("error"));

  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PLCore")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PLAccountingEngineInput")))
    {
      v14 = *(void **)(a1 + 32);
      v15 = (void *)objc_opt_new();
      objc_msgSend(v14, "setAccDS:", v15);

      objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reset");

      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreatePowerEventForward")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreatePowerEventForward:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreatePowerEventBackward")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreatePowerEventBackward:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreatePowerEventInterval")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreatePowerEventInterval:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("AddPowerMeasurementEventInterval")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_AddPowerMeasurementEventInterval:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateDistributionEventForwardAdd")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventForwardAdd:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateDistributionEventForwardRem")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventForwardRem:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateDistributionEventForwardChild")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventForwardChild:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateDistributionEventInterval")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventInterval:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateDistributionEventPoint")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateDistributionEventPoint:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateQualificationEventForwardAdd")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventForwardAdd:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateQualificationEventForwardRem")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventForwardRem:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateQualificationEventForwardChild")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventForwardChild:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateQualificationEventBackward")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventBackward:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateQualificationEventInterval")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventInterval:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CreateQualificationEventPoint")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_CreateQualificationEventPoint:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PLAccountingEngineCore")))
    {
      v17 = *(void **)(a1 + 32);
      v18 = (void *)objc_opt_new();
      objc_msgSend(v17, "setAccDS:", v18);

      objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reset");

      if (objc_msgSend(v8, "isEqualToString:", CFSTR("ExistingTest")))
      {
        objc_msgSend(*(id *)(a1 + 32), "testPLAPIAccounting_ExistingTest:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
    }
LABEL_61:
    v13 = v9;
    goto LABEL_62;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("WriteEntry"))
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("WriteEntries")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("UpdateEntry")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_UpdateEntry:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("DeleteEntry")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteEntry:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("DeleteEntryForKey")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteEntryForKey:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("DeleteAllEntriesForKey")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteAllEntriesForKey:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("DeleteAllEntriesForKeyWF")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteAllEntriesForKeyWF:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("DeleteAllEntriesForKeyBTWF")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_DeleteAllEntriesForKeyBTWF:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("EntriesForKeyWithProperties")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_EntriesForKeyWithProperties:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("EntriesForKeyInTimeRange")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_EntriesForKeyInTimeRange:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("EntriesForKeyBeforeTICWF")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_EntriesForKeyBeforeTICWF:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("LastEntryForKeyWSEK")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_LastEntryForKeyWSEK:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("LastEntryForKeyWC")))
    {
      objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_LastEntryForKeyWC:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    }
    goto LABEL_61;
  }
  objc_msgSend(*(id *)(a1 + 32), "testPLAPICore_WriteEntry:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:
  v20 = v13;

  return v20;
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_422(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "setClientFrameworkTestData:", a5);
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_2_426(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientFrameworkTestData");
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "setClientFrameworkTestData:", a5);
}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientFrameworkTestData");
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ClearData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "clientFrameworkTestDataBatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "removeAllObjects");
  else
    objc_msgSend(v8, "addObject:", v10);

}

id __42__PLDebugService_initOperatorDependancies__block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("Data");
  objc_msgSend(*(id *)(a1 + 32), "clientFrameworkTestDataBatch");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __42__PLDebugService_initOperatorDependancies__block_invoke_452(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_INFO, "Running completion block in debug mode with energyReport=%@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __42__PLDebugService_initOperatorDependancies__block_invoke_458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEnergyMonitorDebugQuery:", a5);
}

- (id)test_LogErr:(id)a3 str:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("--> ERROR: %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("error"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v10);

  return v5;
}

- (id)test_LogPass:(id)a3 str:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("--> PASS: %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v10);

  return v5;
}

- (BOOL)rawRead:(id)a3
{
  return 1;
}

- (BOOL)rawWrite:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  void *v48;
  int v49;
  const __CFString *v50;
  void *v51;
  id v52;
  id v53;
  int v56;
  uint64_t v57;
  void *v58;
  dispatch_semaphore_t v59;
  _QWORD v60[4];
  NSObject *v61;
  _QWORD v62[4];
  NSObject *v63;

  v3 = a3;
  v59 = dispatch_semaphore_create(0);
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");
  v14 = v13 != -1;

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countOfEntriesForKey:", v4);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v17;
  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("WriteEntry")) & 1) == 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("WriteEntries"));

    if (v13 == -1)
      v14 = v20 ^ 1;
    else
      v14 = 1;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("WriteEntries"));

  v58 = v3;
  v56 = v10;
  if ((v22 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 >= 1)
    {
      v24 = 0;
      if (v14)
        v25 = v4;
      else
        v25 = 0;
      do
      {
        v26 = objc_alloc(MEMORY[0x1E0D7FFB0]);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v26, "initWithEntryKey:withDate:", v25, v27);
        objc_msgSend(v23, "addObject:", v28);

        ++v24;
      }
      while (v7 != v24);
    }
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "storage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __27__PLDebugService_rawWrite___block_invoke;
    v62[3] = &unk_1E85780C8;
    v31 = v59;
    v63 = v31;
    objc_msgSend(v30, "writeEntries:withCompletionBlock:", v23, v62);

    LOBYTE(v32) = v14;
    if ((v14 & 1) != 0)
      dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    v32 = v14;
    if (v7 >= 1)
    {
      v33 = 0;
      if (v14)
        v34 = v4;
      else
        v34 = 0;
      do
      {
        v35 = objc_alloc(MEMORY[0x1E0D7FFB0]);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v35, "initWithEntryKey:withDate:", v34, v36);

        objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "storage");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __27__PLDebugService_rawWrite___block_invoke_2;
        v60[3] = &unk_1E85780C8;
        v40 = v59;
        v61 = v40;
        objc_msgSend(v39, "writeEntry:withCompletionBlock:", v37, v60);

        if (v32)
          dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);

        ++v33;
      }
      while (v7 != v33);
    }
  }
  if (v56)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "storage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "storage");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countOfEntriesForKey:", v4);

  if (v57 + v7 == v45)
    v46 = 0;
  else
    v46 = v32;
  v47 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("testName"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("WriteEntries"));
  v50 = CFSTR("y");
  if (v49)
    v50 = CFSTR("ies");
  if ((v46 & 1) != 0)
  {
    objc_msgSend(v47, "stringWithFormat:", CFSTR("WriteEntr%@ (%ld times) failed.  Before:%ld, After:%ld"), v50, v7, v57, v45);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v58, v51);
  }
  else
  {
    objc_msgSend(v47, "stringWithFormat:", CFSTR("WriteEntr%@ (%ld times) passed.  Before:%ld, After:%ld"), v50, v7, v57, v45);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v58, v51);
  }

  return 1;
}

intptr_t __27__PLDebugService_rawWrite___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __27__PLDebugService_rawWrite___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)testPLAPICore_WriteEntry:(id)a3
{
  id v4;

  v4 = a3;
  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  return v4;
}

- (id)testPLAPICore_WriteEntries:(id)a3
{
  id v4;

  v4 = a3;
  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  return v4;
}

- (id)testPLAPICore_UpdateEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  PLDebugService *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  BOOL v35;
  id v36;
  void *v37;
  id v38;
  char v40;
  PLDebugService *v41;
  id v42;
  void *v43;
  void *v44;
  dispatch_semaphore_t v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  uint64_t v49;

  v4 = a3;
  v45 = dispatch_semaphore_create(0);
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iterations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("flush"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  v41 = self;
  v42 = v4;
  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v5;
  objc_msgSend(v15, "entriesForKey:", v5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == -1)
      {
        v20 = 0;
        v19 = v44;
      }
      else
      {
        v19 = v44;
        objc_msgSend(v44, "objectAtIndexedSubscript:", i);
        self = (PLDebugService *)objc_claimAutoreleasedReturnValue();
        v20 = self;
      }
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __44__PLDebugService_testPLAPICore_UpdateEntry___block_invoke;
      v46[3] = &unk_1E857B418;
      v47 = v19;
      v49 = i;
      v21 = v45;
      v48 = v21;
      objc_msgSend(v18, "updateEntry:withBlock:", v20, v46);
      if (v13 == -1)
      {

      }
      else
      {

        dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      }

    }
  }
  if ((v40 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "storage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "storage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "entriesForKey:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v4;
  if (v8 < 1)
    goto LABEL_22;
  v28 = 0;
  v29 = 0;
  do
  {
    v30 = v28 + 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(v28 + 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "entryDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "compare:", v31);

    if (v34)
      ++v29;

    v28 = v30;
  }
  while (v8 != v30);
  v35 = !v29 || v13 == -1;
  v27 = v42;
  if (v35)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UpdateEntry (%ld times) passed."), v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[PLDebugService test_LogPass:str:](v41, "test_LogPass:str:", v27, v37);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UpdateEntry (%ld times) failed - times .  Failures: %ld, array:%@"), v8, v29, v26);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PLDebugService test_LogErr:str:](v41, "test_LogErr:str:", v42, v37);
  }

  return v27;
}

intptr_t __44__PLDebugService_testPLAPICore_UpdateEntry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(*(_QWORD *)(a1 + 48) + 1));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntryDate:", v2);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)testPLAPICore_DeleteEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  char v34;
  void *v35;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iterations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("flush"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countOfEntriesForKey:", v5);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "storage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v5;
  objc_msgSend(v18, "entriesForKey:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "storage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v13 == -1)
      {
        objc_msgSend(v22, "deleteEntry:", 0);
      }
      else
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deleteEntry:", v24);

      }
    }
  }
  if ((v34 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "storage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "storage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countOfEntriesForKey:", v35);

  if (v29 == ((v16 - v8) & ~((v16 - v8) >> 63)))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteEntry (%ld times) passed.  Before:%ld, After:%ld"), v8, v16, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v30);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteEntry (%ld times) failed.  Before:%ld, After:%ld"), v8, v16, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v30);
  }

  return v4;
}

- (id)testPLAPICore_DeleteEntryForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  char v50;
  uint64_t v51;
  PLDebugService *v52;
  id v53;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iterations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("flush"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  v52 = self;
  v53 = v4;
  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  v14 = 0x1E0D80000uLL;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "entriesForKey:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("before: %@"), v17);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v19, "countOfEntriesForKey:", v5);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "storage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v5;
  objc_msgSend(v21, "entriesForKey:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 >= 1)
  {
    v24 = 0;
    if (v13 == -1)
      v25 = 0;
    else
      v25 = v5;
    do
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "entryID");

      objc_msgSend(*(id *)(v14 + 184), "sharedCore");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "storage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "deleteEntryForKey:WithRowID:", v25, v27);

      objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v14 + 184), "sharedCore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "storage");
      v32 = v8;
      v33 = v14;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Deleting %@ (with rowID %lld), now: %ld"), v30, v27, objc_msgSend(v34, "countOfEntriesForKey:", v22));

      v14 = v33;
      v8 = v32;

      ++v24;
    }
    while (v32 != v24);
  }
  if ((v50 & 1) != 0)
  {
    objc_msgSend(*(id *)(v14 + 184), "sharedCore");
    v35 = v14;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "storage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    v14 = v35;
  }
  objc_msgSend(*(id *)(v14 + 184), "sharedCore");
  v38 = v14;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "storage");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "entriesForKey:", v22);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("after: %@"), v41);

  objc_msgSend(*(id *)(v38 + 184), "sharedCore");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "storage");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countOfEntriesForKey:", v22);

  if (v44 == ((v51 - v8) & ~((v51 - v8) >> 63)))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteEntryForKey (%ld times) passed.  Before:%ld, After:%ld"), v8, v51, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v53;
    v47 = -[PLDebugService test_LogPass:str:](v52, "test_LogPass:str:", v53, v45);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteEntryForKey (%ld times) failed.  Before:%ld, After:%ld"), v8, v51, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v53;
    v48 = -[PLDebugService test_LogErr:str:](v52, "test_LogErr:str:", v53, v45);
  }

  return v46;
}

- (id)testPLAPICore_DeleteAllEntriesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countOfEntriesForKey:", v5);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v11 == -1)
    v18 = 0;
  else
    v18 = v5;
  objc_msgSend(v16, "deleteAllEntriesForKey:", v18);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "storage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "storage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countOfEntriesForKey:", v5);

  if (!v23 || v11 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteAllEntriesForKey passed.  Before:%ld, After:%ld"), v14, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteAllEntriesForKey failed.  Before:%ld, After:%ld"), v14, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v24);
  }

  return v4;
}

- (id)testPLAPICore_DeleteAllEntriesForKeyWF:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countOfEntriesForKey:", v5);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v11 == -1)
    v18 = 0;
  else
    v18 = v5;
  objc_msgSend(v16, "deleteAllEntriesForKey:withFilters:", v18, 0);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "storage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "storage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countOfEntriesForKey:", v5);

  if (!v23 || v11 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteAllEntriesForKeyWF passed.  Before:%ld, After:%ld"), v14, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteAllEntriesForKeyWF failed.  Before:%ld, After:%ld"), v14, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v24);
  }

  return v4;
}

- (id)testPLAPICore_DeleteAllEntriesForKeyBTWF:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countOfEntriesForKey:", v5);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == -1)
    v17 = 0;
  else
    v17 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteAllEntriesForKey:beforeTimestamp:withFilters:", v17, v18, 0);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "storage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "storage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countOfEntriesForKey:", v5);

  if (!v23 || v11 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteAllEntriesForKeyBTWF passed.  Before:%ld, After:%ld"), v14, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deleteAllEntriesForKeyBTWF failed.  Before:%ld, After:%ld"), v14, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v24);
  }

  return v4;
}

- (id)testPLAPICore_EntriesForKeyWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countOfEntriesForKey:", v5);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "storage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v11 == -1)
    v20 = 0;
  else
    v20 = v5;
  objc_msgSend(v18, "entriesForKey:withProperties:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v14 == v22 || v11 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyWithProperties passed.  Before:%ld, After:%ld"), v14, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v23);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyWithProperties failed.  Before:%ld, After:%ld"), v14, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v23);
  }

  return v4;
}

- (id)testPLAPICore_EntriesForKeyInTimeRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  v15 = v14;
  objc_msgSend(v13, "timeIntervalSince1970");
  v17 = v16 - v15;

  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countOfEntriesForKey:", v5);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "storage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "storage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v11 == -1)
    v26 = 0;
  else
    v26 = v5;
  objc_msgSend(v24, "entriesForKey:inTimeRange:withFilters:", v26, 0, v15, v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v20 == v28 || v11 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyInTimeRange passed.  Before:%ld, After:%ld"), v20, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v29);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyInTimeRange failed.  Before:%ld, After:%ld"), v20, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v29);
  }

  return v4;
}

- (id)testPLAPICore_EntriesForKeyBeforeTICWF:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countOfEntriesForKey:", v5);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "storage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v11 == -1)
    v20 = 0;
  else
    v20 = v5;
  objc_msgSend(v18, "entriesForKey:before:timeInterval:count:withFilters:", v20, 1, v14, 0, 1.79769313e308);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v14 == v22 || v11 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyBeforeTICWF passed.  Before:%ld, After:%ld"), v14, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v23);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyBeforeTICWF failed.  Before:%ld, After:%ld"), v14, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v23);
  }

  return v4;
}

- (id)testPLAPICore_LastEntryForKeyWSEK:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entriesForKey:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v11 == -1)
    v21 = 0;
  else
    v21 = v5;
  objc_msgSend(v19, "lastEntryForKey:withSubEntryKey:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "compare:", v22))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyInTimeRange failed.  Array:%@, LEFK:%@"), v15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v23);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyInTimeRange passed.  Array:%@, LEFK:%@"), v15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v23);
  }

  return v4;
}

- (id)testPLAPICore_LastEntryForKeyWC:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PLAPITest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  -[PLDebugService rawWrite:](self, "rawWrite:", v4);
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entriesForKey:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", v5, v5, 0);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "storage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "storage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == -1)
    v21 = 0;
  else
    v21 = v5;
  v28[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastEntryForKey:withComparisons:isSingleton:", v21, v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "compare:", v23))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyInTimeRange failed.  Array:%@, LEFK:%@"), v15, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntriesForKeyInTimeRange passed.  Array:%@, LEFK:%@"), v15, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v24);
  }

  return v4;
}

- (id)testPLAPIAccounting_CreatePowerEventForward:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 0, v21, 1.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v23, -1.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, 0, 1.0);

        --v7;
      }
      while (v7);
    }
    v19 = CFSTR("CreatePowerEventForward (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v14, 1.0);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "storage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "verifyLastPowerEventWithRootNodeID:withPower:", 10, 1.0);

    if (!v18)
    {
      v26 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreatePowerEventForward failed."));
      return v4;
    }
    v19 = CFSTR("CreatePowerEventForward passed.");
  }
  v25 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v19);
  return v4;
}

- (id)testPLAPIAccounting_CreatePowerEventBackward:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 0, v21, 2.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 11, v23, -1.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 11, 0, 2.0);

        --v7;
      }
      while (v7);
    }
    v19 = CFSTR("CreatePowerEventBackward (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 11, v14, 2.0);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "storage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "verifyLastPowerEventWithRootNodeID:withPower:", 11, 2.0);

    if (!v18)
    {
      v26 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreatePowerEventBackward failed."));
      return v4;
    }
    v19 = CFSTR("CreatePowerEventBackward passed.");
  }
  v25 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v19);
  return v4;
}

- (id)testPLAPIAccounting_CreatePowerEventInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 0, v22, v23, 3.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, v25, v26, -1.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, 0, v28, 3.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, v30, 0, 3.0);

        --v7;
      }
      while (v7);
    }
    v20 = CFSTR("CreatePowerEventInterval (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, v14, v15, 3.0);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "verifyLastPowerEventWithRootNodeID:withPower:", 2, 3.0);

    if (!v19)
    {
      v32 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreatePowerEventInterval failed."));
      return v4;
    }
    v20 = CFSTR("CreatePowerEventInterval passed.");
  }
  v31 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v20);
  return v4;
}

- (id)testPLAPIAccounting_AddPowerMeasurementEventInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 < 1)
    {
      v18 = CFSTR("AddPowerMeasurementEventInterval (negative) passed.");
    }
    else
    {
      v18 = CFSTR("AddPowerMeasurementEventInterval (negative) passed.");
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v20, v21, -1.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", 0, v23, 4.0);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v25, 0, 4.0);

        --v7;
      }
      while (v7);
    }
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v14, v15, 4.0);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    v18 = CFSTR("AddPowerMeasurementEventInterval passed.");
  }
  v26 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v18);
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventForwardAdd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 1, &stru_1E8587D00, v22);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 1, 0, v24);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 1, CFSTR("App1"), 0);

        --v7;
      }
      while (v7);
    }
    v20 = CFSTR("CreateDistributionEventForwardAdd (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dateByAddingTimeInterval:", -5.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 1, CFSTR("App1"), v15);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 1.0);

    if (!v19)
    {
      v27 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateDistributionEventForwardAdd failed."));
      return v4;
    }
    v20 = CFSTR("CreateDistributionEventForwardAdd passed.");
  }
  v26 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v20);
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventForwardRem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 1, &stru_1E8587D00, v23);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 1, 0, v25);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 1, CFSTR("App1"), 0);

        --v7;
      }
      while (v7);
    }
    v21 = CFSTR("CreateDistributionEventForwardRem (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 1, CFSTR("App1"), v14);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 1, CFSTR("App1"), v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 1.0);

    if (!v20)
    {
      v28 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateDistributionEventForwardRem failed."));
      return v4;
    }
    v21 = CFSTR("CreateDistributionEventForwardRem passed.");
  }
  v27 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v21);
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventForwardChild:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      v21 = MEMORY[0x1E0C9AA70];
      do
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864DB10, v23);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, v21, v25);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864DB38, 0);

        --v7;
      }
      while (v7);
    }
    v20 = CFSTR("CreateDistributionEventForwardChild (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864DAE8, v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 1.0);

    if (!v19)
    {
      v28 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateDistributionEventForwardChild failed."));
      return v4;
    }
    v20 = CFSTR("CreateDistributionEventForwardChild passed.");
  }
  v27 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v20);
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  PLDebugService *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  PLDebugService *v36;
  id v37;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    v36 = self;
    v37 = v4;
    if (v7 >= 1)
    {
      v23 = MEMORY[0x1E0C9AA70];
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date", v36, v37);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dateByAddingTimeInterval:", -5.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateByAddingTimeInterval:", -10.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 20, &unk_1E864DB88, v27, v25);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateByAddingTimeInterval:", -10.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 20, v23, v29, v25);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 20, &unk_1E864DBB0, 0, v25);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateByAddingTimeInterval:", -10.0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 20, &unk_1E864DBD8, v32, 0);

        --v7;
      }
      while (v7);
    }
    v21 = CFSTR("CreateDistributionEventInterval (negative) passed.");
    v22 = v36;
    v4 = v37;
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dateByAddingTimeInterval:", -10.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 20, &unk_1E864DB60, v16, v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 20, CFSTR("App1"), 1.0);

    if (!v20)
    {
      v34 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateDistributionEventInterval failed."));
      return v4;
    }
    v21 = CFSTR("CreateDistributionEventInterval passed.");
    v22 = self;
  }
  v33 = -[PLDebugService test_LogPass:str:](v22, "test_LogPass:str:", v4, v21, v36, v37);
  return v4;
}

- (id)testPLAPIAccounting_CreateDistributionEventPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      v21 = MEMORY[0x1E0C9AA70];
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateByAddingTimeInterval:", -5.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864DC28, v23);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, v21, v23);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864DC50, 0);

        --v7;
      }
      while (v7);
    }
    v20 = CFSTR("CreateDistributionEventPoint (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864DC00, v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 4, CFSTR("App1"), 1.0);

    if (!v19)
    {
      v28 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateDistributionEventPoint failed."));
      return v4;
    }
    v20 = CFSTR("CreateDistributionEventPoint passed.");
  }
  v27 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v20);
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventForwardAdd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  PLDebugService *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v30;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    v30 = v4;
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateByAddingTimeInterval:", -5.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        NSLog(CFSTR("HERE: Line: %d"), 1555);
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createQualificationEventForwardWithQualificationID:withAddingChildNodeName:withStartDate:", 2, 0, v23);

        NSLog(CFSTR("HERE: Line: %d"), 1559);
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "createQualificationEventForwardWithQualificationID:withAddingChildNodeName:withStartDate:", 2, &stru_1E8587D00, v23);

        NSLog(CFSTR("HERE: Line: %d"), 1563);
        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createQualificationEventForwardWithQualificationID:withAddingChildNodeName:withStartDate:", 2, CFSTR("App2"), 0);

        NSLog(CFSTR("HERE: Line: %d"), 1567);
        --v7;
      }
      while (v7);
    }
    v20 = CFSTR("CreateQualificationEventForwardAdd (negative) passed.");
    v21 = self;
    v4 = v30;
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createQualificationEventForwardWithQualificationID:withAddingChildNodeName:withStartDate:", 2, CFSTR("App2"), v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "verifyLastQualificationEventWithQualificationID:withNodeName:", 2, CFSTR("App2"));

    if (!v19)
    {
      v28 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateQualificationEventForwardAdd failed."));
      return v4;
    }
    v20 = CFSTR("CreateQualificationEventForwardAdd passed.");
    v21 = self;
  }
  v27 = -[PLDebugService test_LogPass:str:](v21, "test_LogPass:str:", v4, v20);
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventForwardRem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dateByAddingTimeInterval:", -5.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "createQualificationEventForwardWithQualificationID:withRemovingChildNodeName:withStartDate:", 2, 0, v24);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createQualificationEventForwardWithQualificationID:withRemovingChildNodeName:withStartDate:", 2, &stru_1E8587D00, v24);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "createQualificationEventForwardWithQualificationID:withRemovingChildNodeName:withStartDate:", 2, CFSTR("App2"), 0);

        --v7;
      }
      while (v7);
    }
    v22 = CFSTR("CreateQualificationEventForwardRem (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createQualificationEventForwardWithQualificationID:withAddingChildNodeName:withStartDate:", 2, CFSTR("App3"), v14);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createQualificationEventForwardWithQualificationID:withAddingChildNodeName:withStartDate:", 2, CFSTR("App2"), v14);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "createQualificationEventForwardWithQualificationID:withRemovingChildNodeName:withStartDate:", 2, CFSTR("App2"), v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "storage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "verifyLastQualificationEventWithQualificationID:withNodeName:", 2, CFSTR("App3"));

    if (!v21)
    {
      v29 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateQualificationEventForwardRem failed."));
      return v4;
    }
    v22 = CFSTR("CreateQualificationEventForwardRem passed.");
  }
  v28 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v22);
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventForwardChild:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      v21 = MEMORY[0x1E0C9AA60];
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateByAddingTimeInterval:", -5.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E8652490, v23);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, v21, v23);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E86524A8, 0);

        --v7;
      }
      while (v7);
    }
    v20 = CFSTR("CreateQualificationEventForwardChild (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E8652478, v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "verifyLastQualificationEventWithQualificationID:withNodeName:", 2, CFSTR("App2"));

    if (!v19)
    {
      v28 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateQualificationEventForwardChild failed."));
      return v4;
    }
    v20 = CFSTR("CreateQualificationEventForwardChild passed.");
  }
  v27 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v20);
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventBackward:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  PLDebugService *v27;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 < 1)
    {
      v18 = CFSTR("CreateQualificationEventBackward (negative) passed.");
    }
    else
    {
      v27 = self;
      v19 = MEMORY[0x1E0C9AA60];
      v18 = CFSTR("CreateQualificationEventBackward (negative) passed.");
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dateByAddingTimeInterval:", -5.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", 1, &unk_1E86524D8, v21);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", 1, v19, v21);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", 1, &unk_1E86524F0, 0);

        --v7;
      }
      while (v7);
      self = v27;
    }
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", 0, &unk_1E86524C0, v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    v18 = CFSTR("CreateQualificationEventBackward passed.");
  }
  v25 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v18);
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  PLDebugService *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  PLDebugService *v36;
  id v37;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    v36 = self;
    v37 = v4;
    if (v7 >= 1)
    {
      v23 = MEMORY[0x1E0C9AA60];
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date", v36, v37);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dateByAddingTimeInterval:", -5.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateByAddingTimeInterval:", -10.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", 12, &unk_1E8652520, v27, v25);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateByAddingTimeInterval:", -10.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", 12, v23, v29, v25);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", 12, &unk_1E8652538, 0, v25);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateByAddingTimeInterval:", -10.0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", 12, &unk_1E8652550, v32, 0);

        --v7;
      }
      while (v7);
    }
    v21 = CFSTR("CreateQualificationEventInterval (negative) passed.");
    v22 = v36;
    v4 = v37;
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dateByAddingTimeInterval:", -10.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", 12, &unk_1E8652508, v16, v14);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    -[PLDebugService accDS](self, "accDS");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "verifyLastQualificationEventWithQualificationID:withNodeName:", 12, CFSTR("App2"));

    if (!v20)
    {
      v34 = -[PLDebugService test_LogErr:str:](self, "test_LogErr:str:", v4, CFSTR("CreateQualificationEventInterval failed."));
      return v4;
    }
    v21 = CFSTR("CreateQualificationEventInterval passed.");
    v22 = self;
  }
  v33 = -[PLDebugService test_LogPass:str:](v22, "test_LogPass:str:", v4, v21, v36, v37);
  return v4;
}

- (id)testPLAPIAccounting_CreateQualificationEventPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  PLDebugService *v30;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("validity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "intValue");

  if ((_DWORD)v9 == -1)
  {
    if (v7 >= 1)
    {
      v30 = self;
      v20 = MEMORY[0x1E0C9AA60];
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dateByAddingTimeInterval:", -5.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateByAddingTimeInterval:", -10.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", 0, &unk_1E8652580, v24);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateByAddingTimeInterval:", -10.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", 0, v20, v26);

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", 0, &unk_1E8652598, 0);

        --v7;
      }
      while (v7);
      self = v30;
    }
    v19 = CFSTR("CreateQualificationEventPoint (negative) passed.");
  }
  else
  {
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -5.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dateByAddingTimeInterval:", -10.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", 0, &unk_1E8652568, v16);

        --v7;
      }
      while (v7);
    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

    }
    v19 = CFSTR("CreateQualificationEventPoint passed.");
  }
  v28 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, v19);
  return v4;
}

- (id)testPLAPIAccounting_ExistingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iterations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "longValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("flush"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "BOOLValue");

  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blockingFlushCachesWithReason:", CFSTR("testAPI"));

  }
  v11 = -[PLDebugService test_LogPass:str:](self, "test_LogPass:str:", v4, CFSTR("CreateQualificationEventPoint passed."));
  return v4;
}

- (void)constructTrimQueries
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF98], "allOperatorTablesToTrimConditionsForTrimDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trim Queries %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService constructTrimQueries]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1977);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (void)constructAppIdentifierTables
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "agents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v7)
  {
    v8 = v7;
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "entryKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0D7FFB8], "definitionForEntryKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(MEMORY[0x1E0D7FFB8], "hasAppIdentifierKeysForEntryDefinition:", v16))
                objc_msgSend(v2, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
          }
          while (v12);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("App identifier tables are %@"), v2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService constructAppIdentifierTables]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 1997);

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v17;
    _os_log_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (void)constructDMATables
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "agents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v7)
  {
    v8 = v7;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "entryKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0D7FFB8], "definitionForEntryKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(MEMORY[0x1E0D7FFB8], "hasDMAKeysForEntryDefinition:", v16))
                objc_msgSend(v2, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          }
          while (v12);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v8);
  }

  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "DMA tables are %@", buf, 0xCu);
  }

}

- (void)populateIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    v7 = 0x1E0D80000uLL;
    v21 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D179C2E0]();
        objc_msgSend(*(id *)(v7 + 40), "sharedSQLiteConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "tableExistsForTableName:", v9);

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0D7FFB8], "definitionForEntryKey:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(MEMORY[0x1E0D7FFB8], "hasAppIdentifierKeysForEntryDefinition:", v13))
          {
            v14 = (void *)objc_opt_new();
            v15 = (void *)objc_opt_new();
            v16 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0D7FFB8], "keyConfigsForEntryDefinition:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __38__PLDebugService_populateIdentifiers___block_invoke;
            v22[3] = &unk_1E8580768;
            v18 = v14;
            v23 = v18;
            v19 = v15;
            v24 = v19;
            v20 = v16;
            v25 = v20;
            objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
            if (objc_msgSend(v18, "count"))
              objc_msgSend((id)qword_1ED885318, "setObject:forKeyedSubscript:", v18, v9);
            if (objc_msgSend(v19, "count", v21))
              objc_msgSend((id)qword_1ED885320, "setObject:forKeyedSubscript:", v19, v9);
            if (objc_msgSend(v20, "count"))
              objc_msgSend((id)qword_1ED885328, "setObject:forKeyedSubscript:", v20, v9);

            v3 = v21;
            v7 = 0x1E0D80000;
          }

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v5);
  }

}

void __38__PLDebugService_populateIdentifiers___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D80280]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    objc_msgSend(a1[4], "addObject:", v12);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D80258]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    objc_msgSend(a1[5], "addObject:", v12);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D80310]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    objc_msgSend(a1[6], "addObject:", v12);

}

- (void)iterateAgents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "agents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "entryKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDebugService populateIdentifiers:](self, "populateIdentifiers:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)iterateServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "entryKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDebugService populateIdentifiers:](self, "populateIdentifiers:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)constructAppIdentifierColumns
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED885318;
  qword_1ED885318 = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED885320;
  qword_1ED885320 = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ED885328;
  qword_1ED885328 = v7;

  -[PLDebugService iterateAgents](self, "iterateAgents");
  -[PLDebugService iterateServices](self, "iterateServices");
  objc_msgSend((id)qword_1ED885318, "setObject:forKeyedSubscript:", &unk_1E86525B0, CFSTR("PLAccountingOperator_EventNone_Nodes"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tableNameToBundleIdentifier is %@"), qword_1ED885318);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService constructAppIdentifierColumns]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 2086);

  PLLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tableNameToAppIdentifier is %@"), qword_1ED885320);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService constructAppIdentifierColumns]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 2087);

  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v15;
    _os_log_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tableNameToProcessIdentifier is %@"), qword_1ED885328);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastPathComponent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService constructAppIdentifierColumns]");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 2088);

  PLLogCommon();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v21;
    _os_log_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (void)aggregateDataFromSignpost
{
  NSObject *v2;
  uint8_t v3[16];

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "Manually aggregate data from Signpost", v3, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D7FFA8], "logAggregatedDataFromSignpostWithStartDate:withEndDate:", 0, 0);
}

- (void)fireSignificantBatteryChangeNotification
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void *)objc_opt_new();
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Manually firing SBC", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D80078], "postNotificationName:object:userInfo:", CFSTR("PLBatteryAgent_EventBackward_Battery.filtered.Level_0_1.Level_7_1800.Level_8_300"), self, v3);
}

- (void)testCompression
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_702);

}

void __33__PLDebugService_testCompression__block_invoke()
{
  unsigned int v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(MEMORY[0x1E0D80078], "compressWithSource:withDestination:withLevel:", CFSTR("/tmp/test.txt"), CFSTR("/tmp/test_out.gz"), 4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("compression result=%i"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testCompression]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logMessage:fromFile:fromFunction:fromLineNumber:", v1, v4, v5, 2114);

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v1;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testUTF8
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__PLDebugService_testUTF8__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __26__PLDebugService_testUTF8__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testUTF8]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2120);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

  v8 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Test"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntryKey:", v9);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("MyEuro=€"), CFSTR("StringKey1"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("test"), CFSTR("StringKey2"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E864DC78, CFSTR("DefaultKey1"));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v10);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testUTF8]_block_invoke");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 2129);

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v11;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

}

- (void)stressAggregateSmall
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_727);

}

void __38__PLDebugService_stressAggregateSmall__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressAggregateSmall]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 2135);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v29 = 138412290;
    v30 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v29, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AggregateTestSmall"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAllEntriesForKey:", v6);

  v9 = 0;
  do
  {
    v10 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithEntryKey:withDate:", v6, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unsigned __int16)v9 / 0x96u);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("PrimaryKey1"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("TestKey"), CFSTR("PrimaryKey2"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField2"));
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeAggregateEntry:", v12);

    v16 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithEntryKey:withDate:", CFSTR("PLDisplayAgent_EventForward_Display"), v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("Brightness"));

    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "storage");
    v21 = (void *)v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "writeEntry:withCompletionBlock:", v18, 0);

    v6 = (uint64_t)v21;
    v9 = (v9 + 1);
  }
  while ((_DWORD)v9 != 15000);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastPathComponent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressAggregateSmall]_block_invoke");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 2162);

  PLLogCommon();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v29 = 138412290;
    v30 = v23;
    _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v29, 0xCu);
  }

}

- (void)stressAggregateVerySmall
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_734);

}

void __42__PLDebugService_stressAggregateVerySmall__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressAggregateVerySmall]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 2168);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v28 = 138412290;
    v29 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v28, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AggregateTestVerySmall"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAllEntriesForKey:", v6);

  v9 = 0;
  do
  {
    v10 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithEntryKey:withDate:", v6, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unsigned __int16)v9 / 0x96u);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("PrimaryKey1"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeAggregateEntry:", v12);

    v16 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithEntryKey:withDate:", CFSTR("PLDisplayAgent_EventForward_Display"), v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("Brightness"));

    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "storage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "writeEntry:withCompletionBlock:", v18, 0);

    v9 = (v9 + 1);
  }
  while ((_DWORD)v9 != 15000);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastPathComponent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressAggregateVerySmall]_block_invoke");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 2193);

  PLLogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v28 = 138412290;
    v29 = v22;
    _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v28, 0xCu);
  }

}

- (void)testExit
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_735);

}

uint64_t __26__PLDebugService_testExit__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D80078], "exitWithReason:", 2);
}

- (void)testQuarantineExit
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_736);

}

uint64_t __36__PLDebugService_testQuarantineExit__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D80078], "exitWithReason:", 1006);
}

- (void)testBlockingFlushCaches
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PLDebugService_testBlockingFlushCaches__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __41__PLDebugService_testBlockingFlushCaches__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "blockingFlushCachesWithReason:", CFSTR("PLDebugService"));

}

- (void)stressMonotonicTimer
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unint64_t v18;
  void *v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *context;
  void *v32;
  _QWORD block[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0](self, a2);
  v3 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer: begin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 2218);

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 10;
  v12 = MEMORY[0x1E0C809B0];
  do
  {
    v13 = (void *)MEMORY[0x1E0D80000];
    objc_msgSend(*(id *)(v3 + 3432), "monotonicDateWithTimeIntervalSinceNow:", 5.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v12;
    v36[1] = 3221225472;
    v36[2] = __38__PLDebugService_stressMonotonicTimer__block_invoke;
    v36[3] = &unk_1E85793E0;
    v16 = v4;
    v37 = v16;
    objc_msgSend(v13, "debugScheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v14, v15, v36, 0.0);
    v17 = v4;
    v18 = v3;
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "addObject:", v19);
    v20 = dispatch_time(0, 2000000000);
    -[PLOperator workQueue](self, "workQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __38__PLDebugService_stressMonotonicTimer__block_invoke_745;
    block[3] = &unk_1E85791E0;
    v22 = v16;
    v34 = v22;
    v35 = v19;
    v23 = v19;
    v3 = v18;
    v4 = v17;
    v24 = v23;
    dispatch_after(v20, v21, block);

    sleep(3u);
    --v11;
  }
  while (v11);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer: end"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer]");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 2241);

  PLLogCommon();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v25;
    _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

void __38__PLDebugService_stressMonotonicTimer__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer: *********fired********* at now=%f"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2228);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

void __38__PLDebugService_stressMonotonicTimer__block_invoke_745(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer: reschedule at now=%f"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 2234);

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 2.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setMonotonicFireDate:", v11);

}

- (void)stressMonotonicTimer2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *context;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0](self, a2);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer2: begin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer2]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2248);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v10 = 0;
  v11 = 10;
  do
  {
    v12 = v10;
    v13 = (void *)MEMORY[0x1E0D80000];
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 5.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __39__PLDebugService_stressMonotonicTimer2__block_invoke;
    v24[3] = &unk_1E85793E0;
    v16 = v3;
    v25 = v16;
    objc_msgSend(v13, "debugScheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v14, v15, v24, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    sleep(1u);
    --v11;
  }
  while (v11);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer2: end"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer2]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 2263);

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v17;
    _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

void __39__PLDebugService_stressMonotonicTimer2__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer2: *********fired********* at now=%f"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer2]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2258);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)stressMonotonicTimer3
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *context;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0](self, a2);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer3: begin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer3]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2270);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v8 = 10;
  do
  {
    v9 = (void *)MEMORY[0x1E0D80000];
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 3.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __39__PLDebugService_stressMonotonicTimer3__block_invoke;
    v23[3] = &unk_1E85793E0;
    v12 = v20;
    v24 = v12;
    objc_msgSend(v9, "debugScheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v10, v11, v23, 3.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    sleep(1u);
    sleep(1u);

    --v8;
  }
  while (v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer3: end"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer3]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 2287);

  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

void __39__PLDebugService_stressMonotonicTimer3__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PLDebugService::stressMonotonicTimer3: *********fired********* at now=%f"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMonotonicTimer3]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2280);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testMonotonicTimerThroughSleep
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PLDebugService::testMonotonicTimerThroughSleep: begin at now=%f"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testMonotonicTimerThroughSleep]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2293);

  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v12 = (void *)MEMORY[0x1E0D80000];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 60.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "debugScheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v13, v14, &__block_literal_global_764, 300.0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)monotonicTimer;
  monotonicTimer = v15;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::testMonotonicTimerThroughSleep: end"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testMonotonicTimerThroughSleep]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 2300);

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

void __48__PLDebugService_testMonotonicTimerThroughSleep__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "timeIntervalSince1970");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PLDebugService::testMonotonicTimerThroughSleep: *********fired********* at now=%f"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testMonotonicTimerThroughSleep]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2298);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)stressActivityScheduler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD block[5];
  uint8_t v26[4];
  void *v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  __CFString *v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressActivityScheduler: begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressActivityScheduler]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 2304);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FF58], "timeCriterionWithInterval:", 60.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v9;
  objc_msgSend(MEMORY[0x1E0D7FF50], "pluggedInCriterion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v10;
  objc_msgSend(MEMORY[0x1E0D7FF50], "displayOffCriterion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__16;
  v31 = __Block_byref_object_dispose__16;
  v32 = CFSTR("PLDebugService::scheduler");
  objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  objc_msgSend(MEMORY[0x1E0D7FF58], "timeCriterionWithInterval:", 3600.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scheduleActivityWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:", v14, v12, v15, v16, &__block_literal_global_773, &__block_literal_global_781);

  v17 = dispatch_time(0, 120000000000);
  dispatch_get_global_queue(-2, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PLDebugService_stressActivityScheduler__block_invoke_787;
  block[3] = &unk_1E8578CE8;
  block[4] = &buf;
  dispatch_after(v17, v18, block);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressActivityScheduler: end"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastPathComponent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressActivityScheduler]");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 2340);

  PLLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v26 = 138412290;
    v27 = v19;
    _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", v26, 0xCu);
  }

  _Block_object_dispose(&buf, 8);
}

void __41__PLDebugService_stressActivityScheduler__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::scheduler interrupted!"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressActivityScheduler]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 2315);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }

}

void __41__PLDebugService_stressActivityScheduler__block_invoke_779()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressActivityScheduler: BLOCK begin"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressActivityScheduler]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 2326);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v6 = dispatch_semaphore_create(0);
  v7 = dispatch_time(0, 5000000000);
  dispatch_get_global_queue(-2, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PLDebugService_stressActivityScheduler__block_invoke_784;
  block[3] = &unk_1E85780C8;
  v9 = v6;
  v17 = v9;
  dispatch_after(v7, v8, block);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressActivityScheduler: BLOCK end"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressActivityScheduler]_block_invoke_2");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2332);

  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

intptr_t __41__PLDebugService_stressActivityScheduler__block_invoke_784(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __41__PLDebugService_stressActivityScheduler__block_invoke_787(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelActivityWithIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

- (void)currentBasebandTime
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_790);

}

void __37__PLDebugService_currentBasebandTime__block_invoke()
{
  id v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D80068], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v1, "currentTimeFromTimeReference:toTimeReference:", 3, 3);

}

- (void)stressMidnightCalculation
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_792);

}

void __43__PLDebugService_stressMidnightCalculation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  _QWORD v36[8];

  v36[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1414915200.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1414918800.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1414922400.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1425805200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1425808800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1425812400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v28 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightBeforeDate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", v10);
        if (v12 > 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: d=%@, previousMidnight=%@"), v10, v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMidnightCalculation]_block_invoke");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2368);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v13;
            _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightAfterDate:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", v10);
        if (v20 < 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: d=%@, nextMidnight=%@"), v10, v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressMidnightCalculation]_block_invoke");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 2373);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v21;
            _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

}

- (void)stressCacheSmall
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PLDebugService_stressCacheSmall__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __34__PLDebugService_stressCacheSmall__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stressCacheSmall::begin"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressCacheSmall]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logMessage:fromFile:fromFunction:fromLineNumber:", v1, v4, v5, 2381);

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v1;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AggregateTestSmall"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 5000; ++i)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)((unsigned __int16)i / 0x1F4u) * 3600.0 + 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)v7;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v7, v10);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("TestApp"), CFSTR("PrimaryKey1"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
    objc_msgSend(v8, "addObject:", v12);

    v7 = (uint64_t)v11;
  }
  v13 = *(void **)(a1 + 32);
  v23 = v11;
  v24 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntries:withGroupID:", v14, v11);

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "flushCachesWithReason:", CFSTR("debug stressCache"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stressCacheSmall::end"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressCacheSmall]_block_invoke");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 2401);

  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)stressCache
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PLDebugService_stressCache__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __29__PLDebugService_stressCache__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AggregateTest"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  do
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v1);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("TestApp"), CFSTR("PrimaryKey1"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("TestApp2"), CFSTR("PrimaryKey2"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("SumField"));

    objc_msgSend(v2, "addObject:", v4);
    v3 = (v3 + 1);
  }
  while ((_DWORD)v3 != 11);
  v6 = *(void **)(a1 + 32);
  v10 = v1;
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEntries:withGroupID:", v7, v1);

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flushCachesWithReason:", CFSTR("debug stressCache"));

}

- (void)stressSetObjectForKey
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_807);

}

void __39__PLDebugService_stressSetObjectForKey__block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  v0 = (void *)MEMORY[0x1D179C2E0]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", CFSTR("PLDebugService_Aggregate_AggregateTest"));
  v2 = 10000000;
  do
  {
    objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("NumericalField"));
    --v2;
  }
  while (v2);

  objc_autoreleasePoolPop(v0);
}

- (void)stressObjectForKey
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_810);

}

void __36__PLDebugService_stressObjectForKey__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;

  v0 = (void *)MEMORY[0x1D179C2E0]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", CFSTR("PLDebugService_Aggregate_AggregateTest"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("NumericalField"));
  v2 = 10000000;
  do
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NumericalField"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");

    --v2;
  }
  while (v2);

  objc_autoreleasePoolPop(v0);
}

- (void)stressPLEntry
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLDebugService_stressPLEntry__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __31__PLDebugService_stressPLEntry__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *context;
  uint64_t v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0]();
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Filling Array of Entries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0x1E0D7F000uLL;
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressPLEntry]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v7, v8, 2458);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v10 = 0;
  v38 = a1;
  do
  {
    HIDWORD(v11) = -858993459 * (unsigned __int16)v10;
    LODWORD(v11) = HIDWORD(v11);
    if ((v11 >> 1) <= 0x19999999)
    {
      v12 = v2;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entries.count=%lu"), objc_msgSend(v2, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v4;
      v15 = *(void **)(v4 + 3992);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressPLEntry]_block_invoke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v17, v18, 2460);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = v14;
      v2 = v12;
      a1 = v38;
    }
    objc_msgSend(*(id *)(a1 + 32), "filledTestArrayEntry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v20);

    ++v10;
  }
  while (v10 != 10000);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Filled array of entries to count of %lu, sleeping for 10 seconds"), objc_msgSend(v2, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(v4 + 3992);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastPathComponent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressPLEntry]_block_invoke");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 2463);

  PLLogCommon();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v21;
    _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  sleep(0xAu);
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "entryKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = *(void **)(v38 + 32);
  v39 = v28;
  v40 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "logEntries:withGroupID:", v30, v28);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logged and done!"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *(void **)(v4 + 3992);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastPathComponent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressPLEntry]_block_invoke");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 2467);

  PLLogCommon();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v31;
    _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (void)stressTimer
{
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__PLDebugService_stressTimer__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v4 = xmmword_1CB3893F0;
  dispatch_async(v2, v3);

}

void __29__PLDebugService_stressTimer__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;

  while (1)
  {
    v2 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(double *)(a1 + 32);
    dispatch_get_global_queue(2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v3, 0, 0, v5, &__block_literal_global_821, v4, 0.0);
    v7 = (void *)timer;
    timer = v6;

    sleep(*(double *)(a1 + 40));
  }
}

void __29__PLDebugService_stressTimer__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::stressTimer: timer fired, timer=%@"), timer);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressTimer]_block_invoke_2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 2485);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testDailyTasks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fire Daily Tasks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testDailyTasks]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2493);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dailyTasks");

}

- (void)testArchive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::testArchive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testArchive]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2498);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FF78], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runActivityWithLastCompletedDate:", v9);

}

- (void)testTrimEPSQL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::testTrimEPSQL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testTrimEPSQL]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2503);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FF78], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trimExtendedPersistenceLog");

}

- (void)testTrimCESQL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::testTrimCESQL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testTrimCESQL]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2508);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FF78], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trimCleanEnergyLog");

}

- (void)testTrimXCSQL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::testTrimXCSQL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testTrimXCSQL]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2513);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FF78], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trimXcodeOrganizerLog");

}

- (void)testTrimBGSQL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLDebugService::testTrimBGSQL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testTrimBGSQL]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2518);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FF78], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trimBackgroundProcessingLog");

}

- (id)filledTestArrayEntry
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("ArrayTest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v2);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("RandomString"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", rand());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("RandomNumber"));

  v7 = (void *)objc_opt_new();
  v8 = 10;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", rand());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    --v8;
  }
  while (v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("StaticArrayType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("DynamicArrayType"));

  return v3;
}

- (void)testABM
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("firing ABM tests"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testABM]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2539);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D7FF40], "sharedABMClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getLTESleepManagerStats");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("ABM LTE Sleep MGR stats = %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testABM]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 2540);

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v11;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FF40], "sharedABMClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getBasebandTimeAndLatency");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v18, "time");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "latency");
  objc_msgSend(v19, "stringWithFormat:", CFSTR("ABM BB time = %@, latency = %f"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastPathComponent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testABM]");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 2543);

  PLLogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v22;
    _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PLDebugService filledTestArrayEntry](self, "filledTestArrayEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test array!! entry=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testArray]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2549);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  -[PLOperator logEntry:](self, "logEntry:", v3);
  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("ArrayTest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastEntryForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test array!! dbRead=%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testArray]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2554);

  PLLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v13;
    _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testGenerateOTASubmission
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting generateOTASubmission"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testGenerateOTASubmission]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2558);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D80058], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateOTASubmissionAndSendTaskingEndSubmission:", 1);

}

- (void)testGenerateSafeguardSubmission
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting generateSafeguardSubmission"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testGenerateSafeguardSubmission]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2563);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  +[PPSSafeguardController sharedInstance](PPSSafeguardController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performSubmission");

}

- (void)testScheduleSafeguardSubmission
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting generateSafeguardSubmission"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testScheduleSafeguardSubmission]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2568);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  +[PPSSafeguardController sharedInstance](PPSSafeguardController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheduleSubmission");

}

- (void)stressTaskingSubmission
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting stressTaskingSubmission"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService stressTaskingSubmission]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2573);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v10, 0xCu);
  }

  v8 = 100;
  do
  {
    objc_msgSend(MEMORY[0x1E0D80058], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generateOTASubmissionAndSendTaskingEndSubmission:", 1);

    --v8;
  }
  while (v8);
}

- (void)testFastInserts
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("FastInsertTest"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  do
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("iteration"));

    -[PLOperator logEntry:](self, "logEntry:", v4);
    v3 = (v3 + 1);
  }
  while ((_DWORD)v3 != 2000);

}

- (void)testAllEntryKeyRequests
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *group;
  uint64_t v66;
  _QWORD block[6];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80078], "allSubClassesForClass:", objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sortedArrayUsingComparator:", &__block_literal_global_860);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (v4)
  {
    v5 = v4;
    v62 = *(_QWORD *)v73;
    v60 = v3;
    do
    {
      v6 = 0;
      v61 = v5;
      do
      {
        if (*(_QWORD *)v73 != v62)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v6);
        objc_msgSend(v7, "className");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("PLBBAgent"));

        v63 = v6;
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<rdar://problem/16693449> BBAgent: selector for entryDefinition has to be available on the Operator"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2609);

          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            goto LABEL_33;
LABEL_14:
          *(_DWORD *)buf = 138412290;
          v78 = v10;
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_33;
        }
        objc_msgSend(v7, "className");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("PLIOReport"));

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<rdar://problem/16694077> PLIOReport should use kPLEDLogSelector in the definitions to setup trigger for requests"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v20, v21, 2611);

          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            goto LABEL_33;
          goto LABEL_14;
        }
        objc_msgSend(v7, "className");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "hasPrefix:", CFSTR("PLVideoAgent"));

        if (v23)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<rdar://problem/16694177> PLVideoAgent_EventForward_VRPStatus needs to either be kPLEDOnDemandQuery: @(NO) or have method for requesting"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v26, v27, 2613);

          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            goto LABEL_33;
          goto LABEL_14;
        }
        objc_msgSend(v7, "entryKeys");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sortedArrayUsingSelector:", sel_compare_);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v15 = v29;
        v30 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        if (v30)
        {
          v31 = v30;
          v66 = *(_QWORD *)v69;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v69 != v66)
                objc_enumerationMutation(v15);
              v33 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! entryKey=%@, entryKeys=%@"), v33, v15);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "lastPathComponent");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 2618);

              PLLogCommon();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v34;
                _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              if (objc_msgSend(MEMORY[0x1E0D7FFB8], "isOnDemandQueryableForEntryKey:", v33))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("** Requesting %@"), v33);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "lastPathComponent");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 2620);

                PLLogCommon();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v40;
                  _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                dispatch_get_global_queue(2, 0);
                v46 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __41__PLDebugService_testAllEntryKeyRequests__block_invoke_879;
                block[3] = &unk_1E85791E0;
                block[4] = v33;
                block[5] = self;
                dispatch_group_async(group, v46, block);

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("** Skipping %@"), v33);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "lastPathComponent");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v50, v51, 2631);

                PLLogCommon();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v47;
                  _os_log_debug_impl(&dword_1CAF47000, v52, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            v31 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
          }
          while (v31);
          v10 = v15;
          v3 = v60;
          v5 = v61;
        }
        else
        {
          v10 = v15;
        }
LABEL_33:

        v6 = v63 + 1;
      }
      while (v63 + 1 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("all requests sent... wait time."));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "lastPathComponent");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v56, v57, 2638);

  PLLogCommon();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v53;
    _os_log_debug_impl(&dword_1CAF47000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __41__PLDebugService_testAllEntryKeyRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "className");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __41__PLDebugService_testAllEntryKeyRequests__block_invoke_879(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "requestEntryForEntryKey:forOperator:withTimeout:error:", v2, v3, &v16, 60.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("** Timeout %@: %@"), *(_QWORD *)(a1 + 32), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2627);

    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
LABEL_7:
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("** Response %@: %@"), *(_QWORD *)(a1 + 32), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testAllEntryKeyRequests]_block_invoke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v14, v15, 2625);

    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      goto LABEL_7;
    }
  }

}

- (void)testEntrySleep
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faking a sleep"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntrySleep]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2643);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("DEBUG_FakeSleep"), 0);

}

- (void)testEntryWake
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faking a wake"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryWake]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2648);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("DEBUG_FakeWake"), 0);

}

- (void)testEntryLogRequestedForEntryKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("posting %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryLogRequestedForEntryKey:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2654);

  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FFC8], "requestEntryForEntryKey:forOperator:withTimeout:error:", v4, self, 0, 60.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DONE! %@=%@"), v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryLogRequestedForEntryKey:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2656);

  PLLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v13;
    _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)testEntryApplicationAgent
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PLDebugService_testEntryApplicationAgent__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __43__PLDebugService_testEntryApplicationAgent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastEntryForKey:", CFSTR("PLApplicationAgent_EventForward_Application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastApp=%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryApplicationAgent]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 2664);

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loadDynamicValuesIntoEntry:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastApp(w/D)=%@"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryApplicationAgent]_block_invoke");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 2666);

  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)testEntryDelete
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PLDebugService_testEntryDelete__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __33__PLDebugService_testEntryDelete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *context;
  void *v59;
  uint64_t v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t buf[4];
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0]();
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__16;
  v66 = __Block_byref_object_dispose__16;
  v60 = a1;
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastEntryForKey:", CFSTR("PLBatteryAgent_EventBackward_Battery"));
  v67 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deleting %@ in..."), v63[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryDelete]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 2675);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  LODWORD(v9) = 11;
  do
  {
    sleep(1u);
    v9 = (v9 - 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d..."), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryDelete]_block_invoke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2678);

    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v10;
      _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
  while (v9 > 1);
  objc_msgSend(*(id *)(v60 + 32), "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteEntry:", v63[5]);

  objc_msgSend(*(id *)(v60 + 32), "storage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastEntryForKey:", CFSTR("PLIOReportAgent_EventBackward_IOReport"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deleting %@ in..."), v59);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryDelete]_block_invoke");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 2683);

  PLLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v18;
    _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  LODWORD(v24) = 11;
  do
  {
    sleep(1u);
    v24 = (v24 - 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d..."), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastPathComponent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryDelete]_block_invoke");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 2686);

    PLLogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v25;
      _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
  while (v24 > 1);
  objc_msgSend(*(id *)(v60 + 32), "storage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "deleteEntry:", v59);

  objc_msgSend(*(id *)(v60 + 32), "storage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "lastEntryForKey:", CFSTR("PLBatteryAgent_EventBackward_Battery"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v63[5];
  v63[5] = v33;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updating %@ in..."), v63[5]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "lastPathComponent");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryDelete]_block_invoke");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 2691);

  PLLogCommon();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v35;
    _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  LODWORD(v41) = 11;
  do
  {
    sleep(1u);
    v41 = (v41 - 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d..."), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lastPathComponent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryDelete]_block_invoke");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 2694);

    PLLogCommon();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v42;
      _os_log_debug_impl(&dword_1CAF47000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
  while (v41 > 1);
  v48 = *(void **)(v60 + 32);
  v49 = v63[5];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __33__PLDebugService_testEntryDelete__block_invoke_917;
  v61[3] = &unk_1E8578CE8;
  v61[4] = &v62;
  objc_msgSend(v48, "updateEntry:withBlock:", v49, v61);
  objc_msgSend(*(id *)(v60 + 32), "storage");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "entryForKey:withID:", CFSTR("PLBatteryAgent_EventBackward_Battery"), objc_msgSend((id)v63[5], "entryID"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PreUpdate=%@\nPostUpdate=%@"), v63[5], v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "lastPathComponent");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryDelete]_block_invoke");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "logMessage:fromFile:fromFunction:fromLineNumber:", v52, v55, v56, 2704);

  PLLogCommon();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v52;
    _os_log_debug_impl(&dword_1CAF47000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  _Block_object_dispose(&v62, 8);
  objc_autoreleasePoolPop(context);
}

uint64_t __33__PLDebugService_testEntryDelete__block_invoke_917(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsCharging"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E8634C20, CFSTR("ChemID"));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E8634C38, CFSTR("DesignCapacity"));
}

- (void)testEntryQueries
{
  NSObject *v3;
  _QWORD block[5];

  -[PLOperator workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PLDebugService_testEntryQueries__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __34__PLDebugService_testEntryQueries__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *context;
  uint8_t buf[4];
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastEntryForKey:", CFSTR("PLBatteryAgent_EventBackward_Battery"));
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)v3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Last Battery(%@)=%@"), v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryQueries]_block_invoke");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 2714);

  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v7;
    _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entriesForKey:startingFromRowID:count:withFilters:", CFSTR("PLBatteryAgent_EventBackward_Battery"), 232, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("row %lld=%@"), 232, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryQueries]_block_invoke");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 2721);

  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v15;
    _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entriesForKey:startingFromRowID:count:withFilters:", CFSTR("PLBatteryAgent_EventBackward_Battery"), 232, 5, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("row %lld + 5=%@"), 232, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastPathComponent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryQueries]_block_invoke");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 2724);

  PLLogCommon();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v23;
    _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "entriesForKey:startingFromRowID:count:withFilters:", CFSTR("PLBatteryAgent_EventBackward_Battery"), 232, -5, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("row %lld - 5=%@"), 232, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastPathComponent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryQueries]_block_invoke");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 2727);

  PLLogCommon();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v31;
    _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "entryDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "dateByAddingTimeInterval:", 300.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v40;
  v71 = v38;
  objc_msgSend(v38, "timeIntervalSince1970");
  v44 = v43;
  objc_msgSend(v42, "timeIntervalSince1970");
  v46 = v45;

  v47 = v46 - v44;
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v48 = a1;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "entriesForKey:inTimeRange:withFilters:", CFSTR("PLBatteryAgent_EventBackward_Battery"), 0, v44, v47);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("row %@ - %@=%@"), v39, v41, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "lastPathComponent");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryQueries]_block_invoke");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 2736);

  PLLogCommon();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v51;
    _os_log_debug_impl(&dword_1CAF47000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(v48 + 32), "storage");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "entriesForKey:inTimeRange:withCountOfEntriesBefore:withCountOfEntriesAfter:withFilters:", CFSTR("PLBatteryAgent_EventBackward_Battery"), 10, 10, 0, v44, v47);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("row %@ - %@ +/- 10=%@"), v39, v41, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "lastPathComponent");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryQueries]_block_invoke");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "logMessage:fromFile:fromFunction:fromLineNumber:", v59, v62, v63, 2739);

  PLLogCommon();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v59;
    _os_log_debug_impl(&dword_1CAF47000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  sleep(5u);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alright memory go down!"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "lastPathComponent");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testEntryQueries]_block_invoke");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "logMessage:fromFile:fromFunction:fromLineNumber:", v65, v68, v69, 2742);

  PLLogCommon();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v65;
    _os_log_debug_impl(&dword_1CAF47000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (void)testMonotonicAggregateEntries
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_943);

}

void __47__PLDebugService_testMonotonicAggregateEntries__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int i;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *context;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin testMonotonicAggregateEntries"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testMonotonicAggregateEntries]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 2751);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AggregateTestSplitAndBucket"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAllEntriesForKey:", v6);

  for (i = 0; i != 15000; ++i)
  {
    v10 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithEntryKey:withDate:", v6, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unsigned __int16)i / 0x96u);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("PrimaryKey1"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField2"));
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeAggregateEntry:", v12);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end testMonotonicAggregateEntries"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testMonotonicAggregateEntries]_block_invoke");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 2771);

  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v16;
    _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (void)testMonotonicAggregateEntriesExtendedTime
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_948);

}

void __59__PLDebugService_testMonotonicAggregateEntriesExtendedTime__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *context;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin testMonotonicAggregateEntriesExtendedTime"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testMonotonicAggregateEntriesExtendedTime]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 2779);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AggregateTestSplitAndBucket"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAllEntriesForKey:", v6);

  v9 = 0;
  v10 = 0.0;
  do
  {
    v11 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingTimeInterval:", v10 * 60.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithEntryKey:withDate:", v6, v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unsigned __int16)v9 / 0x96u);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("PrimaryKey1"));

    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField2"));
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "writeAggregateEntry:", v14);

    v10 = v10 + 1.0;
    ++v9;
  }
  while (v9 != 15000);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end testMonotonicAggregateEntriesExtendedTime"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testMonotonicAggregateEntriesExtendedTime]_block_invoke");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 2799);

  PLLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v18;
    _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (void)testProportionateAggregateEntries
{
  NSObject *v2;

  -[PLOperator workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_953);

}

void __51__PLDebugService_testProportionateAggregateEntries__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *context;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin testProportionateAggregateEntries"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testProportionateAggregateEntries]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 2807);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AggregateTestSplitAndBucket"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAllEntriesForKey:", v6);

  v9 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithEntryKey:withDate:", v6, v10);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("PrimaryKey1"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField2"));
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", 60.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v11;
  objc_msgSend(v13, "writeProportionateAggregateEntry:withStartDate:withEndDate:", v11, v14, v16);

  v17 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithEntryKey:withDate:", v6, v18);

  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E8634C50, CFSTR("PrimaryKey1"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField2"));
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "storage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dateByAddingTimeInterval:", 3600.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "writeProportionateAggregateEntry:withStartDate:withEndDate:", v19, v22, v24);

  v25 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithEntryKey:withDate:", v6, v26);

  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E8634C68, CFSTR("PrimaryKey1"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField2"));
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "storage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dateByAddingTimeInterval:", 7200.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "writeProportionateAggregateEntry:withStartDate:withEndDate:", v27, v30, v32);

  v33 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v6;
  v35 = (void *)objc_msgSend(v33, "initWithEntryKey:withDate:", v6, v34);

  objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_1E8634C80, CFSTR("PrimaryKey1"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_1E8634C08, CFSTR("SumField2"));
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "storage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "dateByAddingTimeInterval:", 93600.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "writeProportionateAggregateEntry:withStartDate:withEndDate:", v35, v38, v40);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end testProportionateAggregateEntries"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDebugService.m");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "lastPathComponent");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDebugService testProportionateAggregateEntries]_block_invoke");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 2854);

  PLLogCommon();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v41;
    _os_log_debug_impl(&dword_1CAF47000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(context);
}

- (id)handleEnergyMonitorDebugQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  _QWORD v41[4];
  void *v42;
  _QWORD v43[4];
  void *v44;
  uint8_t buf[4];
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  id v50;
  const __CFString *v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLDebugService energyMonitorDebugInstance](self, "energyMonitorDebugInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("reportStartEvent")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("reportStopEvent")))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activityName"), self);
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("involvedIdentifiers"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requiresNetwork"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "BOOLValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("quality"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cell"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wifi"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("involvedIdentifiers"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("requiresNetwork"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("quality"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("cell"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("wifi"));
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("reportStartEvent")))
      {
        objc_msgSend(v38, "energyMonitorDebugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)v39;
        objc_msgSend(v15, "reportStartEvent:withInfo:", v39, v14);
      }
      else
      {
        v16 = (void *)v39;
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("reportStopEvent")))
        {
LABEL_10:

          v18 = 0;
          v4 = v40;
LABEL_11:
          v17 = v18;

          goto LABEL_12;
        }
        objc_msgSend(v38, "energyMonitorDebugInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reportStopEvent:withInfo:", v39, v14);
      }

      goto LABEL_10;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("getValueForPropertyName")))
    {
      v20 = v6;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("propertyName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDebugService energyMonitorDebugInstance](self, "energyMonitorDebugInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDebugService getValueForPropertyName:forEnergyMonitor:](self, "getValueForPropertyName:forEnergyMonitor:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "isEqualToString:", CFSTR("discretionaryIntervals")))
      {
        v24 = (void *)objc_opt_new();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("discretionaryIntervals"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke;
        v43[3] = &unk_1E8580A30;
        v44 = v24;
        v26 = v24;
        objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v43);
        v51 = CFSTR("response");
        v52[0] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v44;
      }
      else
      {
        if (!objc_msgSend(v21, "isEqualToString:", CFSTR("quickEnergySnapshots")))
        {
          v47 = CFSTR("response");
          v48 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        v31 = (void *)objc_opt_new();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("quickEnergySnapshots"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke_3;
        v41[3] = &unk_1E8579E98;
        v42 = v31;
        v26 = v31;
        objc_msgSend(v25, "enumerateObjectsUsingBlock:", v41);
        v49 = CFSTR("response");
        v50 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v42;
      }

LABEL_27:
      v6 = v20;
      goto LABEL_11;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("updateMockData")))
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/tmp/energy_monitor_debug_config.plist"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v28;
          _os_log_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_INFO, "Updating mockData with newMockData=%@", buf, 0xCu);
        }

        -[PLDebugService energyMonitorDebugInstance](self, "energyMonitorDebugInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "updateMockData:", v28);

        v18 = &unk_1E864DCC8;
      }
      else
      {
        v18 = 0;
      }

      goto LABEL_11;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("reportChargingStatus")))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chargingStatus"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "BOOLValue");

      -[PLDebugService energyMonitorDebugInstance](self, "energyMonitorDebugInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "reportChargingStatus:", v33);

      v18 = &unk_1E864DCF0;
      goto LABEL_11;
    }
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("runMethod")))
    {
      v18 = &unk_1E864DD40;
      goto LABEL_11;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("methodName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "isEqualToString:", CFSTR("generateEnergyReport")))
    {
      v36 = v6;
      -[PLDebugService energyMonitorDebugInstance](self, "energyMonitorDebugInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "generateEnergyReport");
    }
    else
    {
      if (!objc_msgSend(v35, "isEqualToString:", CFSTR("queryPowerlogForDiscretionaryEnergy")))
      {
LABEL_37:

        v18 = &unk_1E864DD18;
        goto LABEL_11;
      }
      v36 = v6;
      -[PLDebugService energyMonitorDebugInstance](self, "energyMonitorDebugInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "queryPowerlogForDiscretionaryEnergy");
    }

    v6 = v36;
    goto LABEL_37;
  }
  v17 = &unk_1E864DCA0;
LABEL_12:

  return v17;
}

void __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke_2;
  v9[3] = &unk_1E8579E98;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);
}

void __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __48__PLDebugService_handleEnergyMonitorDebugQuery___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)getValueForPropertyName:(id)a3 forEnergyMonitor:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void **v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  id v27;
  const __CFString *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Getting value for propertyName=%@", buf, 0xCu);
  }

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("discretionaryIntervals")))
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "intervalManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifierToDiscretionaryIntervals");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v20;
      _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "value=%@", buf, 0xCu);

    }
    v47 = v5;
    objc_msgSend(v6, "intervalManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifierToDiscretionaryIntervals");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("quickEnergySnapshots")))
    {
      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "quickEnergySnapshots");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v22;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "value=%@", buf, 0xCu);

      }
      v45 = v5;
      objc_msgSend(v6, "quickEnergySnapshots");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v46;
      v15 = &v45;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("lastPowerlogResponse")))
    {
      v43 = v5;
      objc_msgSend(v6, "lastPowerlogResponse");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v44;
      v15 = &v43;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("lastReportedTotalEnergy")))
    {
      v41 = v5;
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "lastReportedTotalEnergy");
      objc_msgSend(v16, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v42;
      v15 = &v41;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("lastReportedCPUEnergy")))
    {
      v39 = v5;
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "lastReportedCPUEnergy");
      objc_msgSend(v17, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v40;
      v15 = &v39;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("lastReportedNetworkEnergy")))
    {
      v37 = v5;
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "lastReportedNetworkEnergy");
      objc_msgSend(v18, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v38;
      v15 = &v37;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("accumulatedCPUEnergy")))
    {
      v35 = v5;
      v21 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "accumulatedCPUEnergy");
      objc_msgSend(v21, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v36;
      v15 = &v35;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("accumulatedNetworkEnergy")))
    {
      v33 = v5;
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "accumulatedNetworkEnergy");
      objc_msgSend(v23, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v34;
      v15 = &v33;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("isCharging")))
    {
      v31 = v5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isCharging"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v32;
      v15 = &v31;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("mockData")))
      {
        v27 = v5;
        v28 = CFSTR("No value found for propertyName");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "mockData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v26;
        _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "value=%@", buf, 0xCu);

      }
      v29 = v5;
      objc_msgSend(v6, "mockData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v9;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v30;
      v15 = &v29;
    }
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_31:
  return v11;
}

- (PLXPCListenerOperatorComposition)xpcListenerPLLog
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcListenerPLLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCResponderOperatorComposition)xpcResponderPLLog
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcResponderPLLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCResponderOperatorComposition)xpcResponderPLAPITest
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setXpcResponderPLAPITest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)aggregateTestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAggregateTestListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCResponderOperatorComposition)aggregateTestResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAggregateTestResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)schemaTestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSchemaTestListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLEntryNotificationOperatorComposition)assertionListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssertionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLEntryNotificationOperatorComposition)assertionNewListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAssertionNewListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLEntryNotificationOperatorComposition)assertionUpdateListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAssertionUpdateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLEntryNotificationOperatorComposition)canSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCanSleepNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLEntryNotificationOperatorComposition)sleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSleepNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLEntryNotificationOperatorComposition)wakeNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWakeNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLAccountingDebugService)accDS
{
  return (PLAccountingDebugService *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAccDS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCListenerOperatorComposition)clientFrameworkTestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setClientFrameworkTestListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLXPCResponderOperatorComposition)clientFrameworkTestResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setClientFrameworkTestResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLXPCListenerOperatorComposition)clientFrameworkTestListenerNonAllowlisted
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setClientFrameworkTestListenerNonAllowlisted:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLXPCResponderOperatorComposition)clientFrameworkTestResponderNonAllowlisted
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setClientFrameworkTestResponderNonAllowlisted:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (PLXPCListenerOperatorComposition)clientFrameworkTestListenerBatch
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setClientFrameworkTestListenerBatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (PLXPCResponderOperatorComposition)clientFrameworkTestResponderBatch
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setClientFrameworkTestResponderBatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSDictionary)clientFrameworkTestData
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setClientFrameworkTestData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSMutableArray)clientFrameworkTestDataBatch
{
  return (NSMutableArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setClientFrameworkTestDataBatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (PLXPCResponderOperatorComposition)energyMonitorDebugResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 224, 1);
}

- (void)setEnergyMonitorDebugResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (PLDiscretionaryEnergyMonitor)energyMonitorDebugInstance
{
  return (PLDiscretionaryEnergyMonitor *)objc_getProperty(self, a2, 232, 1);
}

- (void)setEnergyMonitorDebugInstance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyMonitorDebugInstance, 0);
  objc_storeStrong((id *)&self->_energyMonitorDebugResponder, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestDataBatch, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestData, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestResponderBatch, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestListenerBatch, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestResponderNonAllowlisted, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestListenerNonAllowlisted, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestResponder, 0);
  objc_storeStrong((id *)&self->_clientFrameworkTestListener, 0);
  objc_storeStrong((id *)&self->_accDS, 0);
  objc_storeStrong((id *)&self->_wakeNotification, 0);
  objc_storeStrong((id *)&self->_sleepNotification, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);
  objc_storeStrong((id *)&self->_canSleepNotification, 0);
  objc_storeStrong((id *)&self->_assertionUpdateListener, 0);
  objc_storeStrong((id *)&self->_assertionNewListener, 0);
  objc_storeStrong((id *)&self->_assertionListener, 0);
  objc_storeStrong((id *)&self->_schemaTestListener, 0);
  objc_storeStrong((id *)&self->_aggregateTestResponder, 0);
  objc_storeStrong((id *)&self->_aggregateTestListener, 0);
  objc_storeStrong((id *)&self->_xpcResponderPLAPITest, 0);
  objc_storeStrong((id *)&self->_xpcResponderPLLog, 0);
  objc_storeStrong((id *)&self->_xpcListenerPLLog, 0);
}

@end
