@implementation PSGDiagnostics

+ (id)getDiagnosticsInfoForReportCrash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", 103);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = objc_msgSend(&unk_24FCBBA18, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(&unk_24FCBBA18);
        v6 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v16, "experimentIdentifiersWithNamespaceName:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "experimentId");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "deploymentId");
        objc_msgSend(v7, "treatmentId");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v7 || !-[__CFString length](v8, "length") || !-[__CFString length](v10, "length"))
        {

          v9 = 0xFFFFFFFFLL;
          v10 = CFSTR("<nil>");
          v8 = CFSTR("<nil>");
        }
        v24[0] = CFSTR("experimentId");
        v24[1] = CFSTR("treatmentId");
        v25[0] = v8;
        v25[1] = v10;
        v24[2] = CFSTR("deploymentId");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v6);
      }
      v3 = objc_msgSend(&unk_24FCBBA18, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v3);
  }
  v22 = CFSTR("experimentInfo");
  v23 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
