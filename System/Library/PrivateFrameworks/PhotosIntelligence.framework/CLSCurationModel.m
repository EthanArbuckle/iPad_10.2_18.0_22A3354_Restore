@implementation CLSCurationModel

+ (id)baseSpecificationWithSpecification:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  CLSCurationModelSpecification *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLSCurationModel;
  v3 = a3;
  objc_msgSendSuper2(&v12, sel_baseSpecificationWithSpecification_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "sceneAnalysisVersion", v12.receiver, v12.super_class);

  v6 = objc_msgSend(v4, "sceneAnalysisVersion");
  v7 = objc_msgSend(MEMORY[0x24BE72680], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v7)
    v6 = v7;
  v8 = objc_msgSend(MEMORY[0x24BE72698], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v8)
    v6 = v8;
  v9 = SimilarityModelVersionFromSceneAnalysisVersion();
  if (v6 <= v9)
    v6 = v9;
  v10 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, objc_msgSend(v4, "mediaAnalysisVersion"), objc_msgSend(v4, "faceAnalysisVersion"));

  return v10;
}

+ (id)firstReasonForAvoidForKeyAssetFromStatistics:(id *)a3
{
  if (a3->var0)
    return CFSTR("Hidden Persons");
  if (a3->var1)
    return CFSTR("Panorama");
  if (a3->var2.var0)
    return CFSTR("Low Sharpness Score");
  if (a3->var2.var1)
    return CFSTR("Low Aesthetics Score");
  if (a3->var2.var2)
    return CFSTR("Low Failure Score");
  if (a3->var2.var3)
    return CFSTR("Low TastefullyBlurred Score");
  if (a3->var2.var4)
    return CFSTR("Low Lighting Score");
  if (a3->var3)
    return CFSTR("Junk for Memories");
  if (a3->var4)
    return CFSTR("Uninteresting Video");
  if (a3->var5)
    return CFSTR("Low Autoplay Score");
  if (a3->var6)
    return CFSTR("Poor Video Res + No Loc");
  if (a3->var7)
    return CFSTR("Risky File Format");
  if (a3->var8)
    return CFSTR("Blocklisted Imported By");
  if (a3->var9)
    return CFSTR("Meme");
  if (a3->var10)
    return CFSTR("Wrong Rotation");
  if (a3->var11)
    return CFSTR("Poor Photo Resolution");
  if (a3->var12)
    return CFSTR("Unacceptable User Feedback");
  if (a3->var13.var0)
    return CFSTR("NSFW");
  if (a3->var14.var0)
    return CFSTR("Junk Failure");
  if (a3->var14.var1)
    return CFSTR("Blood");
  if (a3->var14.var2)
    return CFSTR("Funeral");
  if (a3->var14.var3)
    return CFSTR("Hospital");
  if (a3->var14.var4)
    return CFSTR("Vehicle Crash");
  if (a3->var14.var5)
    return CFSTR("War");
  return CFSTR("Unknown Reason");
}

+ (void)logInfo:(id)a3 prefix:(id)a4 avoidForKeyAssetStatistics:(id *)a5
{
  unsigned int var0;
  unsigned int var1;
  unsigned int v10;
  unsigned int v11;
  unsigned int var2;
  unsigned int var3;
  unsigned int var4;
  unsigned int v15;
  unsigned int var7;
  unsigned int var8;
  unsigned int var9;
  unsigned int var10;
  unsigned int var11;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int var5;
  int v28;
  id v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  unsigned int v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  unsigned int v63;
  __int16 v64;
  unsigned int v65;
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  unsigned int v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    var0 = a5->var0;
    var1 = a5->var1;
    v10 = a5->var2.var0;
    v11 = a5->var2.var1;
    var2 = a5->var2.var2;
    var3 = a5->var2.var3;
    var4 = a5->var2.var4;
    v15 = a5->var3;
    var7 = a5->var7;
    var8 = a5->var8;
    var9 = a5->var9;
    var10 = a5->var10;
    var11 = a5->var11;
    v21 = a5->var13.var0;
    v22 = a5->var14.var0;
    v23 = a5->var14.var1;
    v24 = a5->var14.var2;
    v25 = a5->var14.var3;
    v26 = a5->var14.var4;
    var5 = a5->var14.var5;
    v28 = 138417410;
    v29 = a4;
    v30 = 1024;
    v31 = var0;
    v32 = 1024;
    v33 = var1;
    v34 = 1024;
    v35 = v10;
    v36 = 1024;
    v37 = v11;
    v38 = 1024;
    v39 = var2;
    v40 = 1024;
    v41 = var3;
    v42 = 1024;
    v43 = var4;
    v44 = 1024;
    v45 = v15;
    v46 = 1024;
    v47 = var7;
    v48 = 1024;
    v49 = var8;
    v50 = 1024;
    v51 = var9;
    v52 = 1024;
    v53 = var10;
    v54 = 1024;
    v55 = var11;
    v56 = 1024;
    v57 = v21;
    v58 = 1024;
    v59 = v22;
    v60 = 1024;
    v61 = v23;
    v62 = 1024;
    v63 = v24;
    v64 = 1024;
    v65 = v25;
    v66 = 1024;
    v67 = v26;
    v68 = 1024;
    v69 = var5;
    _os_log_impl(&dword_243C3E000, (os_log_t)a3, OS_LOG_TYPE_INFO, "%@ Avoided for key asset: %d for hidden persons, %d for panorama, %d for low sharpness, %d for low aesthetics, %d for high failure, %d for low tasteBlur, %d for unpleasant lighting, %d for junkForMemories, %d for risky file format, %d for blocklisted importedBy, %d for meme, %d for wrong rotation, %d for poor resolution, %d for NSFW, %d for junkFailure, %d for blood, %d for funeral, %d for hospital, %d for vehicle crash, %d for war", (uint8_t *)&v28, 0x84u);
  }
}

+ (void)logInfoInIndividualLine:(id)a3 prefix:(id)a4 avoidForKeyAssetStatistics:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void (**v11)(void *, _QWORD, const __CFString *);
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__CLSCurationModel_logInfoInIndividualLine_prefix_avoidForKeyAssetStatistics___block_invoke;
  v12[3] = &unk_25147F640;
  v9 = v7;
  v13 = v9;
  v10 = v8;
  v14 = v10;
  v11 = (void (**)(void *, _QWORD, const __CFString *))_Block_copy(v12);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_impl(&dword_243C3E000, v9, OS_LOG_TYPE_INFO, "%@ Avoided for key asset: {", buf, 0xCu);
  }
  v11[2](v11, a5->var0, CFSTR("hidden persons"));
  v11[2](v11, a5->var1, CFSTR("panorama"));
  v11[2](v11, a5->var2.var0, CFSTR("low sharpness"));
  v11[2](v11, a5->var2.var1, CFSTR("low aesthetics"));
  v11[2](v11, a5->var2.var2, CFSTR("high failure"));
  v11[2](v11, a5->var2.var3, CFSTR("low tasteBlur"));
  v11[2](v11, a5->var2.var4, CFSTR("unpleasant lighting"));
  v11[2](v11, a5->var3, CFSTR("junkForMemories"));
  v11[2](v11, a5->var7, CFSTR("risky file format"));
  v11[2](v11, a5->var8, CFSTR("blocklisted importedBy"));
  v11[2](v11, a5->var9, CFSTR("meme"));
  v11[2](v11, a5->var10, CFSTR("wrong rotation"));
  v11[2](v11, a5->var11, CFSTR("poor resolution"));
  v11[2](v11, a5->var13.var0, CFSTR("explicit NSFW"));
  v11[2](v11, a5->var14.var0, CFSTR("junkFailure"));
  v11[2](v11, a5->var14.var1, CFSTR("blood"));
  v11[2](v11, a5->var14.var2, CFSTR("funeral"));
  v11[2](v11, a5->var14.var3, CFSTR("hospital"));
  v11[2](v11, a5->var14.var4, CFSTR("vehicle crash"));
  v11[2](v11, a5->var14.var5, CFSTR("war"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_impl(&dword_243C3E000, v9, OS_LOG_TYPE_INFO, "%@ }", buf, 0xCu);
  }

}

void __78__CLSCurationModel_logInfoInIndividualLine_prefix_avoidForKeyAssetStatistics___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_243C3E000, v6, OS_LOG_TYPE_INFO, "%@ Filtered out %d for %@", (uint8_t *)&v8, 0x1Cu);
  }

}

- (CLSCurationModel)initWithCurationModelSpecification:(id)a3
{
  id v4;
  CLSCurationModel *v5;
  uint64_t v6;
  uint64_t v7;
  CLSEntityNetModel *entityNetModel;
  uint64_t v9;
  CLSIconicScoreModel *iconicScoreModel;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSCurationModel;
  v5 = -[CLSCurationModel_v5 initWithCurationModelSpecification:](&v12, sel_initWithCurationModelSpecification_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "sceneAnalysisVersion");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE72680]), "initWithSceneAnalysisVersion:", v6);
    entityNetModel = v5->_entityNetModel;
    v5->_entityNetModel = (CLSEntityNetModel *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE72698]), "initWithSceneAnalysisVersion:", objc_msgSend(v4, "sceneAnalysisVersion"));
    iconicScoreModel = v5->_iconicScoreModel;
    v5->_iconicScoreModel = (CLSIconicScoreModel *)v9;

    v5->_similarityModelVersion = SimilarityModelVersionFromSceneAnalysisVersion();
  }

  return v5;
}

- (CLSEntityNetModel)entityNetModel
{
  return (CLSEntityNetModel *)objc_getProperty(self, a2, 200, 1);
}

- (CLSIconicScoreModel)iconicScoreModel
{
  return (CLSIconicScoreModel *)objc_getProperty(self, a2, 208, 1);
}

- (unint64_t)similarityModelVersion
{
  return self->_similarityModelVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconicScoreModel, 0);
  objc_storeStrong((id *)&self->_entityNetModel, 0);
}

uint64_t __74__CLSCurationModel_v3_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __55__CLSCurationModel_v3_enumerateSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __51__CLSCurationModel_v3_processedSignalsFromSignals___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processSignals:intoProcessedSignals:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __74__CLSCurationModel_v5_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __55__CLSCurationModel_v5_enumerateSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __74__CLSCurationModel_v4_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __55__CLSCurationModel_v4_enumerateSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

@end
