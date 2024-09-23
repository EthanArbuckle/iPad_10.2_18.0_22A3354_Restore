@implementation PXUpNextSettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUpNextSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[PXUpNextSettings setForceFallbackMemories:](self, "setForceFallbackMemories:", 0);
  -[PXUpNextSettings setEnableCustomVectors:](self, "setEnableCustomVectors:", 0);
  -[PXUpNextSettings setOverrideMemoriesResult:](self, "setOverrideMemoriesResult:", 0);
  -[PXUpNextSettings setCurationMode:](self, "setCurationMode:", 0);
  -[PXUpNextSettings _featureWeightVectorsFromCurationMode:](self, "_featureWeightVectorsFromCurationMode:", -[PXUpNextSettings curationMode](self, "curationMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextSettings _updateSettingsVectors:](self, "_updateSettingsVectors:", v3);

}

- (void)setOverrideMemoriesResult:(BOOL)a3
{
  self->_overrideMemoriesResult = a3;
}

- (void)setForceFallbackMemories:(BOOL)a3
{
  self->_forceFallbackMemories = a3;
}

- (void)setEnableCustomVectors:(BOOL)a3
{
  self->_enableCustomVectors = a3;
}

- (void)setCurationMode:(unint64_t)a3
{
  self->_curationMode = a3;
}

- (unint64_t)curationMode
{
  return self->_curationMode;
}

- (void)_updateSettingsVectors:(id)a3
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[6];

  v86[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextSettings setVector0:](self, "setVector0:", v5);

  -[PXUpNextSettings vector0](self, "vector0");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  -[PXUpNextSettings setPersonWeight0:](self, "setPersonWeight0:");

  -[PXUpNextSettings vector0](self, "vector0");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  -[PXUpNextSettings setSceneWeight0:](self, "setSceneWeight0:");

  -[PXUpNextSettings vector0](self, "vector0");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  -[PXUpNextSettings setLocationWeight0:](self, "setLocationWeight0:");

  -[PXUpNextSettings vector0](self, "vector0");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  -[PXUpNextSettings setDateWeight0:](self, "setDateWeight0:");

  -[PXUpNextSettings vector0](self, "vector0");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  -[PXUpNextSettings setMeaningWeight0:](self, "setMeaningWeight0:");

  -[PXUpNextSettings vector0](self, "vector0");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  -[PXUpNextSettings setMemoryFeatureWeight0:](self, "setMemoryFeatureWeight0:");

  -[PXUpNextSettings vector0](self, "vector0");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  -[PXUpNextSettings setTripWeight0:](self, "setTripWeight0:");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextSettings setVector1:](self, "setVector1:", v20);

  -[PXUpNextSettings vector1](self, "vector1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  -[PXUpNextSettings setPersonWeight1:](self, "setPersonWeight1:");

  -[PXUpNextSettings vector1](self, "vector1");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  -[PXUpNextSettings setSceneWeight1:](self, "setSceneWeight1:");

  -[PXUpNextSettings vector1](self, "vector1");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  -[PXUpNextSettings setLocationWeight1:](self, "setLocationWeight1:");

  -[PXUpNextSettings vector1](self, "vector1");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  -[PXUpNextSettings setDateWeight1:](self, "setDateWeight1:");

  -[PXUpNextSettings vector1](self, "vector1");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  -[PXUpNextSettings setMeaningWeight1:](self, "setMeaningWeight1:");

  -[PXUpNextSettings vector1](self, "vector1");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatValue");
  -[PXUpNextSettings setMemoryFeatureWeight1:](self, "setMemoryFeatureWeight1:");

  -[PXUpNextSettings vector1](self, "vector1");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  -[PXUpNextSettings setTripWeight1:](self, "setTripWeight1:");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextSettings setVector2:](self, "setVector2:", v35);

  -[PXUpNextSettings vector2](self, "vector2");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "floatValue");
  -[PXUpNextSettings setPersonWeight2:](self, "setPersonWeight2:");

  -[PXUpNextSettings vector2](self, "vector2");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");
  -[PXUpNextSettings setSceneWeight2:](self, "setSceneWeight2:");

  -[PXUpNextSettings vector2](self, "vector2");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "floatValue");
  -[PXUpNextSettings setLocationWeight2:](self, "setLocationWeight2:");

  -[PXUpNextSettings vector2](self, "vector2");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectAtIndexedSubscript:", 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "floatValue");
  -[PXUpNextSettings setDateWeight2:](self, "setDateWeight2:");

  -[PXUpNextSettings vector2](self, "vector2");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectAtIndexedSubscript:", 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "floatValue");
  -[PXUpNextSettings setMeaningWeight2:](self, "setMeaningWeight2:");

  -[PXUpNextSettings vector2](self, "vector2");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectAtIndexedSubscript:", 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "floatValue");
  -[PXUpNextSettings setMemoryFeatureWeight2:](self, "setMemoryFeatureWeight2:");

  -[PXUpNextSettings vector2](self, "vector2");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectAtIndexedSubscript:", 6);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "floatValue");
  -[PXUpNextSettings setTripWeight2:](self, "setTripWeight2:");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextSettings setVector3:](self, "setVector3:", v50);

  -[PXUpNextSettings vector3](self, "vector3");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "floatValue");
  -[PXUpNextSettings setPersonWeight3:](self, "setPersonWeight3:");

  -[PXUpNextSettings vector3](self, "vector3");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectAtIndexedSubscript:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatValue");
  -[PXUpNextSettings setSceneWeight3:](self, "setSceneWeight3:");

  -[PXUpNextSettings vector3](self, "vector3");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectAtIndexedSubscript:", 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "floatValue");
  -[PXUpNextSettings setLocationWeight3:](self, "setLocationWeight3:");

  -[PXUpNextSettings vector3](self, "vector3");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectAtIndexedSubscript:", 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "floatValue");
  -[PXUpNextSettings setDateWeight3:](self, "setDateWeight3:");

  -[PXUpNextSettings vector3](self, "vector3");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectAtIndexedSubscript:", 4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "floatValue");
  -[PXUpNextSettings setMeaningWeight3:](self, "setMeaningWeight3:");

  -[PXUpNextSettings vector3](self, "vector3");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectAtIndexedSubscript:", 5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "floatValue");
  -[PXUpNextSettings setMemoryFeatureWeight3:](self, "setMemoryFeatureWeight3:");

  -[PXUpNextSettings vector3](self, "vector3");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectAtIndexedSubscript:", 6);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "floatValue");
  -[PXUpNextSettings setTripWeight3:](self, "setTripWeight3:");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXUpNextSettings setVector4:](self, "setVector4:", v65);
  -[PXUpNextSettings vector4](self, "vector4");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "floatValue");
  -[PXUpNextSettings setPersonWeight4:](self, "setPersonWeight4:");

  -[PXUpNextSettings vector4](self, "vector4");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "floatValue");
  -[PXUpNextSettings setSceneWeight4:](self, "setSceneWeight4:");

  -[PXUpNextSettings vector4](self, "vector4");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "objectAtIndexedSubscript:", 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "floatValue");
  -[PXUpNextSettings setLocationWeight4:](self, "setLocationWeight4:");

  -[PXUpNextSettings vector4](self, "vector4");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "objectAtIndexedSubscript:", 3);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "floatValue");
  -[PXUpNextSettings setDateWeight4:](self, "setDateWeight4:");

  -[PXUpNextSettings vector4](self, "vector4");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "objectAtIndexedSubscript:", 4);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "floatValue");
  -[PXUpNextSettings setMeaningWeight4:](self, "setMeaningWeight4:");

  -[PXUpNextSettings vector4](self, "vector4");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectAtIndexedSubscript:", 5);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "floatValue");
  -[PXUpNextSettings setMemoryFeatureWeight4:](self, "setMemoryFeatureWeight4:");

  -[PXUpNextSettings vector4](self, "vector4");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "objectAtIndexedSubscript:", 6);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "floatValue");
  -[PXUpNextSettings setTripWeight4:](self, "setTripWeight4:");

  -[PXUpNextSettings vector0](self, "vector0");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextSettings vector1](self, "vector1", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v81;
  -[PXUpNextSettings vector2](self, "vector2");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v82;
  -[PXUpNextSettings vector3](self, "vector3");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v83;
  -[PXUpNextSettings vector4](self, "vector4");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v86[4] = v84;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 5);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextSettings setFeatureWeightVectors:](self, "setFeatureWeightVectors:", v85);

}

- (NSArray)vector4
{
  return self->_vector4;
}

- (NSArray)vector3
{
  return self->_vector3;
}

- (NSArray)vector2
{
  return self->_vector2;
}

- (NSArray)vector1
{
  return self->_vector1;
}

- (NSArray)vector0
{
  return self->_vector0;
}

- (void)setVector4:(id)a3
{
  objc_storeStrong((id *)&self->_vector4, a3);
}

- (void)setVector3:(id)a3
{
  objc_storeStrong((id *)&self->_vector3, a3);
}

- (void)setVector2:(id)a3
{
  objc_storeStrong((id *)&self->_vector2, a3);
}

- (void)setVector1:(id)a3
{
  objc_storeStrong((id *)&self->_vector1, a3);
}

- (void)setVector0:(id)a3
{
  objc_storeStrong((id *)&self->_vector0, a3);
}

- (void)setTripWeight4:(float)a3
{
  self->_tripWeight4 = a3;
}

- (void)setTripWeight3:(float)a3
{
  self->_tripWeight3 = a3;
}

- (void)setTripWeight2:(float)a3
{
  self->_tripWeight2 = a3;
}

- (void)setTripWeight1:(float)a3
{
  self->_tripWeight1 = a3;
}

- (void)setTripWeight0:(float)a3
{
  self->_tripWeight0 = a3;
}

- (void)setSceneWeight4:(float)a3
{
  self->_sceneWeight4 = a3;
}

- (void)setSceneWeight3:(float)a3
{
  self->_sceneWeight3 = a3;
}

- (void)setSceneWeight2:(float)a3
{
  self->_sceneWeight2 = a3;
}

- (void)setSceneWeight1:(float)a3
{
  self->_sceneWeight1 = a3;
}

- (void)setSceneWeight0:(float)a3
{
  self->_sceneWeight0 = a3;
}

- (void)setPersonWeight4:(float)a3
{
  self->_personWeight4 = a3;
}

- (void)setPersonWeight3:(float)a3
{
  self->_personWeight3 = a3;
}

- (void)setPersonWeight2:(float)a3
{
  self->_personWeight2 = a3;
}

- (void)setPersonWeight1:(float)a3
{
  self->_personWeight1 = a3;
}

- (void)setPersonWeight0:(float)a3
{
  self->_personWeight0 = a3;
}

- (void)setMemoryFeatureWeight4:(float)a3
{
  self->_memoryFeatureWeight4 = a3;
}

- (void)setMemoryFeatureWeight3:(float)a3
{
  self->_memoryFeatureWeight3 = a3;
}

- (void)setMemoryFeatureWeight2:(float)a3
{
  self->_memoryFeatureWeight2 = a3;
}

- (void)setMemoryFeatureWeight1:(float)a3
{
  self->_memoryFeatureWeight1 = a3;
}

- (void)setMemoryFeatureWeight0:(float)a3
{
  self->_memoryFeatureWeight0 = a3;
}

- (void)setMeaningWeight4:(float)a3
{
  self->_meaningWeight4 = a3;
}

- (void)setMeaningWeight3:(float)a3
{
  self->_meaningWeight3 = a3;
}

- (void)setMeaningWeight2:(float)a3
{
  self->_meaningWeight2 = a3;
}

- (void)setMeaningWeight1:(float)a3
{
  self->_meaningWeight1 = a3;
}

- (void)setMeaningWeight0:(float)a3
{
  self->_meaningWeight0 = a3;
}

- (void)setLocationWeight4:(float)a3
{
  self->_locationWeight4 = a3;
}

- (void)setLocationWeight3:(float)a3
{
  self->_locationWeight3 = a3;
}

- (void)setLocationWeight2:(float)a3
{
  self->_locationWeight2 = a3;
}

- (void)setLocationWeight1:(float)a3
{
  self->_locationWeight1 = a3;
}

- (void)setLocationWeight0:(float)a3
{
  self->_locationWeight0 = a3;
}

- (void)setFeatureWeightVectors:(id)a3
{
  objc_storeStrong((id *)&self->_featureWeightVectors, a3);
}

- (void)setDateWeight4:(float)a3
{
  self->_dateWeight4 = a3;
}

- (void)setDateWeight3:(float)a3
{
  self->_dateWeight3 = a3;
}

- (void)setDateWeight2:(float)a3
{
  self->_dateWeight2 = a3;
}

- (void)setDateWeight1:(float)a3
{
  self->_dateWeight1 = a3;
}

- (void)setDateWeight0:(float)a3
{
  self->_dateWeight0 = a3;
}

- (id)_featureWeightVectorsFromCurationMode:(unint64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    -[PXUpNextSettings _mostRelevantFeatureWeightVectors](self, "_mostRelevantFeatureWeightVectors");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    -[PXUpNextSettings _varietyFeatureWeightVectors](self, "_varietyFeatureWeightVectors");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (id)_varietyFeatureWeightVectors
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  _QWORD v45[6];

  v45[5] = *MEMORY[0x1E0C80C00];
  LODWORD(v2) = 10.0;
  LODWORD(v3) = 10.0;
  LODWORD(v4) = 10.0;
  LODWORD(v5) = 20.0;
  LODWORD(v6) = 10.0;
  LODWORD(v7) = 20.0;
  LODWORD(v8) = 10.0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v2, v3, v4, v5, v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 5.0;
  LODWORD(v12) = 10.0;
  LODWORD(v13) = -15.0;
  LODWORD(v14) = 1.0;
  LODWORD(v15) = 5.0;
  LODWORD(v16) = 0;
  LODWORD(v17) = 0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v11, v12, v13, v14, v15, v16, v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v18;
  LODWORD(v19) = -15.0;
  LODWORD(v20) = 5.0;
  LODWORD(v21) = 5.0;
  LODWORD(v22) = 5.0;
  LODWORD(v23) = 2.5;
  LODWORD(v24) = 0;
  LODWORD(v25) = 0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v19, v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v26;
  LODWORD(v27) = 20.0;
  LODWORD(v28) = 10.0;
  LODWORD(v29) = 0;
  LODWORD(v30) = 1.0;
  LODWORD(v31) = 5.0;
  LODWORD(v32) = 0;
  LODWORD(v33) = 0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v27, v28, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v34;
  LODWORD(v35) = 5.0;
  LODWORD(v36) = 5.0;
  LODWORD(v37) = 5.0;
  LODWORD(v38) = -20.0;
  LODWORD(v39) = 2.5;
  LODWORD(v40) = 0;
  LODWORD(v41) = 0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v35, v36, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)_weightArrayWithWeightForPerson:(float)a3 scene:(float)a4 location:(float)a5 date:(float)a6 meaning:(float)a7 memoryFeature:(float)a8 trip:(float)a9
{
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  _QWORD v30[8];

  v30[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v17;
  *(float *)&v18 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v19;
  *(float *)&v20 = a6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v21;
  *(float *)&v22 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v23;
  *(float *)&v24 = a8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v25;
  *(float *)&v26 = a9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)settingsControllerModule
{
  id v3;
  void *v4;
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
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Curation Mode"), CFSTR("curationMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "possibleValues:titles:", &unk_1E53E9720, &unk_1E53E9738);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_enabledCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCondition:", v6);

  v7 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Fallback Memories"), CFSTR("forceFallbackMemories"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Override Memories Result"), CFSTR("overrideMemoriesResult"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Custom Vector"), CFSTR("enableCustomVectors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  v17[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v11, CFSTR("General"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v12);
  objc_msgSend(a1, "_upNextVectorSliderSections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Up Next"), v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_upNextVectorSliderSections
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  uint64_t v24;
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
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[10];

  v48[8] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (*MEMORY[0x1E0D72308])
  {
    v5 = 0;
    v24 = *MEMORY[0x1E0D72308];
    v25 = v3;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("personWeight%lu"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sceneWeight%lu"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("locationWeight%lu"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dateWeight%lu"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("meaningWeight%lu"), v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("memoryFeatureWeight%lu"), v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tripWeight%lu"), v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0D83010];
      v13 = (void *)MEMORY[0x1E0D830A0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __51__PXUpNextSettings_UI___upNextVectorSliderSections__block_invoke;
      v40[3] = &unk_1E5127448;
      v41 = v6;
      v42 = v7;
      v43 = v8;
      v44 = v9;
      v45 = v10;
      v46 = v11;
      v47 = v12;
      v39 = v12;
      v38 = v11;
      v33 = v10;
      v34 = v9;
      v35 = v8;
      v36 = v7;
      v37 = v6;
      objc_msgSend(v13, "actionWithHandler:", v40);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "rowWithTitle:action:", CFSTR("Zero All Weights (Vector can't be all 0s)"), v14);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feature Weight Vector %lu"), v5);
      v15 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0D83078];
      v27 = (void *)v15;
      v48[0] = v32;
      objc_msgSend(a1, "_featureSliderForFeature:valueKeyPath:", CFSTR("Person"), v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v30;
      objc_msgSend(a1, "_featureSliderForFeature:valueKeyPath:", CFSTR("Scene"), v36);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v29;
      objc_msgSend(a1, "_featureSliderForFeature:valueKeyPath:", CFSTR("Location"), v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v48[3] = v28;
      objc_msgSend(a1, "_featureSliderForFeature:valueKeyPath:", CFSTR("Date"), v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v48[4] = v16;
      objc_msgSend(a1, "_featureSliderForFeature:valueKeyPath:", CFSTR("Meaning"), v33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v48[5] = v17;
      objc_msgSend(a1, "_featureSliderForFeature:valueKeyPath:", CFSTR("Memory Feature"), v38);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v48[6] = v18;
      objc_msgSend(a1, "_featureSliderForFeature:valueKeyPath:", CFSTR("Trip"), v39);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48[7] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_enabledCondition");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sectionWithRows:title:condition:", v20, v27, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v25;
      objc_msgSend(v25, "addObject:", v22);

      ++v5;
    }
    while (v24 != v5);
  }
  return v4;
}

+ (id)_featureSliderForFeature:(id)a3 valueKeyPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", -20.0, 20.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_increment:", 0.1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_enabledCondition
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_enableCustomVectors);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K != 0"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__PXUpNextSettings_UI___upNextVectorSliderSections__block_invoke(_QWORD *a1)
{
  void *v2;

  +[PXUpNextSettings sharedInstance](PXUpNextSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKeyPath:", &unk_1E53EF9B0, a1[4]);
  objc_msgSend(v2, "setValue:forKeyPath:", &unk_1E53EF9B0, a1[5]);
  objc_msgSend(v2, "setValue:forKeyPath:", &unk_1E53EF9B0, a1[6]);
  objc_msgSend(v2, "setValue:forKeyPath:", &unk_1E53EF9B0, a1[7]);
  objc_msgSend(v2, "setValue:forKeyPath:", &unk_1E53EF9B0, a1[8]);
  objc_msgSend(v2, "setValue:forKeyPath:", &unk_1E53EF9B0, a1[9]);
  objc_msgSend(v2, "setValue:forKeyPath:", &unk_1E53EF9B0, a1[10]);
  objc_msgSend(v2, "performPostSaveActions");

  return 1;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)performPostSaveActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  objc_super v123;
  _QWORD v124[6];

  v124[5] = *MEMORY[0x1E0C80C00];
  v123.receiver = self;
  v123.super_class = (Class)PXUpNextSettings;
  -[PXSettings performPostSaveActions](&v123, sel_performPostSaveActions);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB2B58];
  objc_msgSend(v3, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (-[PXUpNextSettings enableCustomVectors](self, "enableCustomVectors"))
  {
    -[PXUpNextSettings personWeight0](self, "personWeight0");
    v8 = v7;
    -[PXUpNextSettings sceneWeight0](self, "sceneWeight0");
    v10 = v9;
    -[PXUpNextSettings locationWeight0](self, "locationWeight0");
    v12 = v11;
    -[PXUpNextSettings dateWeight0](self, "dateWeight0");
    v14 = v13;
    -[PXUpNextSettings meaningWeight0](self, "meaningWeight0");
    v16 = v15;
    -[PXUpNextSettings memoryFeatureWeight0](self, "memoryFeatureWeight0");
    v18 = v17;
    -[PXUpNextSettings tripWeight0](self, "tripWeight0");
    LODWORD(v20) = v19;
    LODWORD(v21) = v8;
    LODWORD(v22) = v10;
    LODWORD(v23) = v12;
    LODWORD(v24) = v14;
    LODWORD(v25) = v16;
    LODWORD(v26) = v18;
    -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v21, v22, v23, v24, v25, v26, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUpNextSettings setVector0:](self, "setVector0:", v27);

    -[PXUpNextSettings vector0](self, "vector0");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v28, *MEMORY[0x1E0D72310]);

    -[PXUpNextSettings personWeight1](self, "personWeight1");
    v30 = v29;
    -[PXUpNextSettings sceneWeight1](self, "sceneWeight1");
    v32 = v31;
    -[PXUpNextSettings locationWeight1](self, "locationWeight1");
    v34 = v33;
    -[PXUpNextSettings dateWeight1](self, "dateWeight1");
    v36 = v35;
    -[PXUpNextSettings meaningWeight1](self, "meaningWeight1");
    v38 = v37;
    -[PXUpNextSettings memoryFeatureWeight1](self, "memoryFeatureWeight1");
    v40 = v39;
    -[PXUpNextSettings tripWeight1](self, "tripWeight1");
    LODWORD(v42) = v41;
    LODWORD(v43) = v30;
    LODWORD(v44) = v32;
    LODWORD(v45) = v34;
    LODWORD(v46) = v36;
    LODWORD(v47) = v38;
    LODWORD(v48) = v40;
    -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v43, v44, v45, v46, v47, v48, v42);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUpNextSettings setVector1:](self, "setVector1:", v49);

    -[PXUpNextSettings vector1](self, "vector1");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v50, *MEMORY[0x1E0D72318]);

    -[PXUpNextSettings personWeight2](self, "personWeight2");
    v52 = v51;
    -[PXUpNextSettings sceneWeight2](self, "sceneWeight2");
    v54 = v53;
    -[PXUpNextSettings locationWeight2](self, "locationWeight2");
    v56 = v55;
    -[PXUpNextSettings dateWeight2](self, "dateWeight2");
    v58 = v57;
    -[PXUpNextSettings meaningWeight2](self, "meaningWeight2");
    v60 = v59;
    -[PXUpNextSettings memoryFeatureWeight2](self, "memoryFeatureWeight2");
    v62 = v61;
    -[PXUpNextSettings tripWeight2](self, "tripWeight2");
    LODWORD(v64) = v63;
    LODWORD(v65) = v52;
    LODWORD(v66) = v54;
    LODWORD(v67) = v56;
    LODWORD(v68) = v58;
    LODWORD(v69) = v60;
    LODWORD(v70) = v62;
    -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v65, v66, v67, v68, v69, v70, v64);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUpNextSettings setVector2:](self, "setVector2:", v71);

    -[PXUpNextSettings vector2](self, "vector2");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v72, *MEMORY[0x1E0D72320]);

    -[PXUpNextSettings personWeight3](self, "personWeight3");
    v74 = v73;
    -[PXUpNextSettings sceneWeight3](self, "sceneWeight3");
    v76 = v75;
    -[PXUpNextSettings locationWeight3](self, "locationWeight3");
    v78 = v77;
    -[PXUpNextSettings dateWeight3](self, "dateWeight3");
    v80 = v79;
    -[PXUpNextSettings meaningWeight3](self, "meaningWeight3");
    v82 = v81;
    -[PXUpNextSettings memoryFeatureWeight3](self, "memoryFeatureWeight3");
    v84 = v83;
    -[PXUpNextSettings tripWeight3](self, "tripWeight3");
    LODWORD(v86) = v85;
    LODWORD(v87) = v74;
    LODWORD(v88) = v76;
    LODWORD(v89) = v78;
    LODWORD(v90) = v80;
    LODWORD(v91) = v82;
    LODWORD(v92) = v84;
    -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v87, v88, v89, v90, v91, v92, v86);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUpNextSettings setVector3:](self, "setVector3:", v93);

    -[PXUpNextSettings vector3](self, "vector3");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v94, *MEMORY[0x1E0D72328]);

    -[PXUpNextSettings personWeight4](self, "personWeight4");
    v96 = v95;
    -[PXUpNextSettings sceneWeight4](self, "sceneWeight4");
    v98 = v97;
    -[PXUpNextSettings locationWeight4](self, "locationWeight4");
    v100 = v99;
    -[PXUpNextSettings dateWeight4](self, "dateWeight4");
    v102 = v101;
    -[PXUpNextSettings meaningWeight4](self, "meaningWeight4");
    v104 = v103;
    -[PXUpNextSettings memoryFeatureWeight4](self, "memoryFeatureWeight4");
    v106 = v105;
    -[PXUpNextSettings tripWeight4](self, "tripWeight4");
    LODWORD(v108) = v107;
    LODWORD(v109) = v96;
    LODWORD(v110) = v98;
    LODWORD(v111) = v100;
    LODWORD(v112) = v102;
    LODWORD(v113) = v104;
    LODWORD(v114) = v106;
    -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v109, v110, v111, v112, v113, v114, v108);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUpNextSettings setVector4:](self, "setVector4:", v115);

    -[PXUpNextSettings vector4](self, "vector4");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v116, *MEMORY[0x1E0D72330]);

    -[PXUpNextSettings vector0](self, "vector0");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v124[0] = v117;
    -[PXUpNextSettings vector1](self, "vector1");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v124[1] = v118;
    -[PXUpNextSettings vector2](self, "vector2");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v124[2] = v119;
    -[PXUpNextSettings vector3](self, "vector3");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v124[3] = v120;
    -[PXUpNextSettings vector4](self, "vector4");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v124[4] = v121;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 5);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUpNextSettings setFeatureWeightVectors:](self, "setFeatureWeightVectors:", v122);

  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0D72310]);
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0D72318]);
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0D72320]);
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0D72328]);
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0D72330]);
  }
  objc_msgSend(v3, "setPersistentDomain:forName:", v6, v4);

}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXUpNextSettings;
  -[PXUpNextSettings didChangeValueForKey:](&v12, sel_didChangeValueForKey_, v4);
  NSStringFromSelector(sel_enableCustomVectors);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  v6 = v5;
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
  {
LABEL_7:
    -[PXUpNextSettings performPostSaveActions](self, "performPostSaveActions");
    goto LABEL_10;
  }
  NSStringFromSelector(sel_curationMode);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v4)
  {

  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v4, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_10;
  }
  -[PXUpNextSettings _featureWeightVectorsFromCurationMode:](self, "_featureWeightVectorsFromCurationMode:", -[PXUpNextSettings curationMode](self, "curationMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextSettings _updateSettingsVectors:](self, "_updateSettingsVectors:", v11);
  -[PXUpNextSettings performPostSaveActions](self, "performPostSaveActions");

LABEL_10:
}

- (id)_mostRelevantFeatureWeightVectors
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  _QWORD v45[6];

  v45[5] = *MEMORY[0x1E0C80C00];
  LODWORD(v2) = 10.0;
  LODWORD(v3) = 10.0;
  LODWORD(v4) = 10.0;
  LODWORD(v5) = 1.0;
  LODWORD(v6) = 10.0;
  LODWORD(v7) = 10.0;
  LODWORD(v8) = 10.0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v2, v3, v4, v5, v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 10.0;
  LODWORD(v12) = 10.0;
  LODWORD(v13) = 10.0;
  LODWORD(v14) = 1.0;
  LODWORD(v15) = 10.0;
  LODWORD(v16) = 10.0;
  LODWORD(v17) = 10.0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v11, v12, v13, v14, v15, v16, v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v18;
  LODWORD(v19) = 10.0;
  LODWORD(v20) = 10.0;
  LODWORD(v21) = 10.0;
  LODWORD(v22) = 1.0;
  LODWORD(v23) = 10.0;
  LODWORD(v24) = 10.0;
  LODWORD(v25) = 10.0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v19, v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v26;
  LODWORD(v27) = 10.0;
  LODWORD(v28) = 10.0;
  LODWORD(v29) = 10.0;
  LODWORD(v30) = 1.0;
  LODWORD(v31) = 10.0;
  LODWORD(v32) = 10.0;
  LODWORD(v33) = 10.0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v27, v28, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v34;
  LODWORD(v35) = 10.0;
  LODWORD(v36) = 10.0;
  LODWORD(v37) = 10.0;
  LODWORD(v38) = 1.0;
  LODWORD(v39) = 10.0;
  LODWORD(v40) = 10.0;
  LODWORD(v41) = 10.0;
  -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v35, v36, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (BOOL)forceFallbackMemories
{
  return self->_forceFallbackMemories;
}

- (BOOL)enableCustomVectors
{
  return self->_enableCustomVectors;
}

- (BOOL)overrideMemoriesResult
{
  return self->_overrideMemoriesResult;
}

- (NSArray)featureWeightVectors
{
  return self->_featureWeightVectors;
}

- (float)personWeight0
{
  return self->_personWeight0;
}

- (float)sceneWeight0
{
  return self->_sceneWeight0;
}

- (float)locationWeight0
{
  return self->_locationWeight0;
}

- (float)dateWeight0
{
  return self->_dateWeight0;
}

- (float)meaningWeight0
{
  return self->_meaningWeight0;
}

- (float)memoryFeatureWeight0
{
  return self->_memoryFeatureWeight0;
}

- (float)tripWeight0
{
  return self->_tripWeight0;
}

- (float)personWeight1
{
  return self->_personWeight1;
}

- (float)sceneWeight1
{
  return self->_sceneWeight1;
}

- (float)locationWeight1
{
  return self->_locationWeight1;
}

- (float)dateWeight1
{
  return self->_dateWeight1;
}

- (float)meaningWeight1
{
  return self->_meaningWeight1;
}

- (float)memoryFeatureWeight1
{
  return self->_memoryFeatureWeight1;
}

- (float)tripWeight1
{
  return self->_tripWeight1;
}

- (float)personWeight2
{
  return self->_personWeight2;
}

- (float)sceneWeight2
{
  return self->_sceneWeight2;
}

- (float)locationWeight2
{
  return self->_locationWeight2;
}

- (float)dateWeight2
{
  return self->_dateWeight2;
}

- (float)meaningWeight2
{
  return self->_meaningWeight2;
}

- (float)memoryFeatureWeight2
{
  return self->_memoryFeatureWeight2;
}

- (float)tripWeight2
{
  return self->_tripWeight2;
}

- (float)personWeight3
{
  return self->_personWeight3;
}

- (float)sceneWeight3
{
  return self->_sceneWeight3;
}

- (float)locationWeight3
{
  return self->_locationWeight3;
}

- (float)dateWeight3
{
  return self->_dateWeight3;
}

- (float)meaningWeight3
{
  return self->_meaningWeight3;
}

- (float)memoryFeatureWeight3
{
  return self->_memoryFeatureWeight3;
}

- (float)tripWeight3
{
  return self->_tripWeight3;
}

- (float)personWeight4
{
  return self->_personWeight4;
}

- (float)sceneWeight4
{
  return self->_sceneWeight4;
}

- (float)locationWeight4
{
  return self->_locationWeight4;
}

- (float)dateWeight4
{
  return self->_dateWeight4;
}

- (float)meaningWeight4
{
  return self->_meaningWeight4;
}

- (float)memoryFeatureWeight4
{
  return self->_memoryFeatureWeight4;
}

- (float)tripWeight4
{
  return self->_tripWeight4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector4, 0);
  objc_storeStrong((id *)&self->_vector3, 0);
  objc_storeStrong((id *)&self->_vector2, 0);
  objc_storeStrong((id *)&self->_vector1, 0);
  objc_storeStrong((id *)&self->_vector0, 0);
  objc_storeStrong((id *)&self->_featureWeightVectors, 0);
}

+ (PXUpNextSettings)sharedInstance
{
  if (sharedInstance_onceToken_187426 != -1)
    dispatch_once(&sharedInstance_onceToken_187426, &__block_literal_global_187427);
  return (PXUpNextSettings *)(id)sharedInstance_sharedInstance_187428;
}

void __34__PXUpNextSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "upNextSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_187428;
  sharedInstance_sharedInstance_187428 = v0;

}

@end
