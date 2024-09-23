@implementation VLLocalizationCrowdsourcingDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VLLocalizationCrowdsourcingDetails)initWithStats:(void *)a3 resultTransform:(double *)a4
{
  id v7;
  VLLocalizationCrowdsourcingDetails *v8;
  VLLocalizationCrowdsourcingDetails *v9;
  VLLocalizationCrowdsourcingDetails *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)VLLocalizationCrowdsourcingDetails;
  v8 = -[VLLocalizationCrowdsourcingDetails init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_statistics, a3);
    v9->_resultPoseRotation[0][0] = *a4;
    v9->_resultPoseRotation[0][1] = a4[4];
    v9->_resultPoseRotation[0][2] = a4[8];
    v9->_resultPoseRotation[1][0] = a4[1];
    v9->_resultPoseRotation[1][1] = a4[5];
    v9->_resultPoseRotation[1][2] = a4[9];
    v9->_resultPoseRotation[2][0] = a4[2];
    v9->_resultPoseRotation[2][1] = a4[6];
    v9->_resultPoseRotation[2][2] = a4[10];
    v9->_resultPoseTranslation[0] = a4[12];
    v9->_resultPoseTranslation[1] = a4[13];
    v9->_resultPoseTranslation[2] = a4[14];
    v10 = v9;
  }

  return v9;
}

- (VLLocalizationCrowdsourcingDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  double *v8;
  double *v9;
  double *v10;
  double *v11;
  VLLocalizationCrowdsourcingDetails *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  objc_super v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statistics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_9;
  v23.receiver = self;
  v23.super_class = (Class)VLLocalizationCrowdsourcingDetails;
  self = -[VLLocalizationCrowdsourcingDetails init](&v23, sel_init);
  if (!self)
    goto LABEL_9;
  v22 = 0;
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("resultPoseRotation"), &v22);
  if (v22 != 72)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0B88];
    v26 = *MEMORY[0x24BDBD370];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("resultPoseRotation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = (void **)v27;
    v18 = &v26;
LABEL_8:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 4864, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failWithError:", v20);

LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v8 = *(double **)v7;
  self->_resultPoseRotation[0][0] = **(double **)v7;
  self->_resultPoseRotation[0][1] = v8[1];
  self->_resultPoseRotation[0][2] = v8[2];
  v9 = *(double **)(v7 + 8);
  self->_resultPoseRotation[1][0] = *v9;
  self->_resultPoseRotation[1][1] = v9[1];
  self->_resultPoseRotation[1][2] = v9[2];
  v10 = *(double **)(v7 + 16);
  self->_resultPoseRotation[2][0] = *v10;
  self->_resultPoseRotation[2][1] = v10[1];
  self->_resultPoseRotation[2][2] = v10[2];
  v22 = 0;
  v6 = objc_retainAutorelease(v6);
  v11 = (double *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("resultPoseTranslation"), &v22);
  if (v22 != 24)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0B88];
    v24 = *MEMORY[0x24BDBD370];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), CFSTR("resultPoseTranslation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v25;
    v18 = &v24;
    goto LABEL_8;
  }
  self->_resultPoseTranslation[0] = *v11;
  self->_resultPoseTranslation[1] = v11[1];
  self->_resultPoseTranslation[2] = v11[2];
  objc_storeStrong((id *)&self->_statistics, v5);
  self = self;
  v12 = self;
LABEL_10:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  _VLStatistics *statistics;
  id v5;

  statistics = self->_statistics;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", statistics, CFSTR("statistics"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_resultPoseRotation, 72, CFSTR("resultPoseRotation"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_resultPoseTranslation, 24, CFSTR("resultPoseTranslation"));

}

- (unint64_t)inliersCount
{
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v2;

  v2 = -[_VLStatistics stats](self->_statistics, "stats");
  return v2->var12 & ~(v2->var12 >> 31);
}

- (float)points2D
{
  return (float *)-[_VLStatistics stats](self->_statistics, "stats")[8];
}

- (double)points3D
{
  return *(double **)-[_VLStatistics stats](self->_statistics, "stats");
}

- (int)inlierIndices
{
  return (int *)-[_VLStatistics stats](self->_statistics, "stats")[16];
}

- (unint64_t)frameCount
{
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v2;

  v2 = -[_VLStatistics stats](self->_statistics, "stats");
  return v2->var20 & ~(v2->var20 >> 31);
}

- (double)slamOrigin
{
  return (double *)(-[_VLStatistics stats](self->_statistics, "stats") + 144);
}

- (unint64_t)slamTracksCount
{
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v2;

  v2 = -[_VLStatistics stats](self->_statistics, "stats");
  return v2->var35 & ~(v2->var35 >> 31);
}

- (float)slamTracks
{
  return (float *)-[_VLStatistics stats](self->_statistics, "stats")[192];
}

- (unint64_t)descriptorDimension
{
  $EA16241FF5FAACBBBC823CFA4C5CA9E3 *v2;

  v2 = -[_VLStatistics stats](self->_statistics, "stats");
  return v2->var24 & ~(v2->var24 >> 31);
}

- (char)slamTrackDescriptors
{
  return (char *)-[_VLStatistics stats](self->_statistics, "stats")[200];
}

- (signed)slamTrackObservations
{
  return (signed __int16 *)-[_VLStatistics stats](self->_statistics, "stats")[232];
}

- (float)slamTracks2D
{
  return (float *)-[_VLStatistics stats](self->_statistics, "stats")[216];
}

- (signed)slamTrackImageIndices
{
  return (signed __int16 *)-[_VLStatistics stats](self->_statistics, "stats")[224];
}

- (int)perFrameVioStatusCodes
{
  return (int *)-[_VLStatistics stats](self->_statistics, "stats")[256];
}

- (float)perFrameVioPoses
{
  return (float *)-[_VLStatistics stats](self->_statistics, "stats")[264];
}

- (float)perFrameCalibrationMatrices
{
  return (float *)-[_VLStatistics stats](self->_statistics, "stats")[272];
}

- (float)perFrameDistortion
{
  return (float *)-[_VLStatistics stats](self->_statistics, "stats")[280];
}

- (double)resultPoseRotation
{
  return self->_resultPoseRotation[0];
}

- (double)resultPoseTranslation
{
  return self->_resultPoseTranslation;
}

- (_VLStatistics)statistics
{
  return self->_statistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
