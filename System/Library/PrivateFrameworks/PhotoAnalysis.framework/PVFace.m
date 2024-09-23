@implementation PVFace

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PVFace;
  v4 = -[PVObject copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "_copyPropertiesFrom:copyPropertiesOption:", self, 0);
  return v4;
}

- (void)_copyPropertiesFrom:(id)a3 copyPropertiesOption:(int64_t)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *personLocalIdentifier;
  NSString *v10;
  NSString *adjustmentVersion;
  int64_t v12;
  NSString *v13;
  NSString *v14;
  double v15;
  double v16;
  double v17;
  char v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  PVFaceprint *v23;
  PVFaceprint *faceprint;
  NSString *v25;
  NSString *groupingIdentifier;
  void *v27;

  v6 = a3;
  v7 = v6;
  v27 = v6;
  switch(a4)
  {
    case 0:
      objc_msgSend(v6, "personLocalIdentifier");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      personLocalIdentifier = self->_personLocalIdentifier;
      self->_personLocalIdentifier = v8;

      -[PVFace setCoordinatesAndFeaturesFromFace:](self, "setCoordinatesAndFeaturesFromFace:", v27);
      self->_isTooSmall = objc_msgSend(v27, "isTooSmall");
      self->_hidden = objc_msgSend(v27, "hidden");
      self->_isInTrash = objc_msgSend(v27, "isInTrash");
      self->_manual = objc_msgSend(v27, "manual");
      objc_msgSend(v27, "adjustmentVersion");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      adjustmentVersion = self->_adjustmentVersion;
      self->_adjustmentVersion = v10;

      self->_nameSource = objc_msgSend(v27, "nameSource");
      self->_trainingType = objc_msgSend(v27, "trainingType");
      v12 = objc_msgSend(v27, "clusterSequenceNumber");
      v7 = v27;
      self->_clusterSequenceNumber = v12;
      break;
    case 1:
      objc_msgSend(v6, "personLocalIdentifier");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = self->_personLocalIdentifier;
      self->_personLocalIdentifier = v13;

      self->_sourceWidth = objc_msgSend(v27, "sourceWidth");
      self->_sourceHeight = objc_msgSend(v27, "sourceHeight");
      objc_msgSend(v27, "centerX");
      self->_centerX = v15;
      objc_msgSend(v27, "centerY");
      self->_centerY = v16;
      objc_msgSend(v27, "size");
      self->_size = v17;
      self->_qualityMeasure = objc_msgSend(v27, "qualityMeasure");
      self->_clusterSequenceNumber = objc_msgSend(v27, "clusterSequenceNumber");
      self->_isTooSmall = objc_msgSend(v27, "isTooSmall");
      self->_hidden = objc_msgSend(v27, "hidden");
      self->_isInTrash = objc_msgSend(v27, "isInTrash");
      v18 = objc_msgSend(v27, "manual");
      v7 = v27;
      self->_manual = v18;
      break;
    case 2:
      -[PVFace setCoordinatesAndFeaturesFromFace:](self, "setCoordinatesAndFeaturesFromFace:", v6);
      self->_isTooSmall = objc_msgSend(v27, "isTooSmall");
      self->_hidden = objc_msgSend(v27, "hidden");
      self->_isInTrash = objc_msgSend(v27, "isInTrash");
      self->_manual = objc_msgSend(v27, "manual");
      objc_msgSend(v27, "adjustmentVersion");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = self->_adjustmentVersion;
      self->_adjustmentVersion = v19;

      v7 = v27;
      goto LABEL_5;
    case 3:
LABEL_5:
      self->_nameSource = objc_msgSend(v7, "nameSource");
      self->_trainingType = objc_msgSend(v27, "trainingType");
      objc_msgSend(v27, "personLocalIdentifier");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      v22 = self->_personLocalIdentifier;
      self->_personLocalIdentifier = v21;

      self->_clusterSequenceNumber = objc_msgSend(v27, "clusterSequenceNumber");
      objc_msgSend(v27, "faceprint");
      v23 = (PVFaceprint *)objc_claimAutoreleasedReturnValue();
      faceprint = self->_faceprint;
      self->_faceprint = v23;

      objc_msgSend(v27, "groupingIdentifier");
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      groupingIdentifier = self->_groupingIdentifier;
      self->_groupingIdentifier = v25;

      v7 = v27;
      break;
    default:
      break;
  }

}

- (void)setCoordinatesAndFeaturesFromFace:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSString *v16;
  NSString *groupingIdentifier;
  double v18;
  double v19;
  double v20;

  v4 = a3;
  self->_sourceWidth = objc_msgSend(v4, "sourceWidth");
  self->_sourceHeight = objc_msgSend(v4, "sourceHeight");
  objc_msgSend(v4, "centerX");
  self->_centerX = v5;
  objc_msgSend(v4, "centerY");
  self->_centerY = v6;
  objc_msgSend(v4, "size");
  self->_size = v7;
  objc_msgSend(v4, "leftEyeX");
  self->_leftEyeX = v8;
  objc_msgSend(v4, "leftEyeY");
  self->_leftEyeY = v9;
  objc_msgSend(v4, "rightEyeX");
  self->_rightEyeX = v10;
  objc_msgSend(v4, "rightEyeY");
  self->_rightEyeY = v11;
  objc_msgSend(v4, "mouthX");
  self->_mouthX = v12;
  objc_msgSend(v4, "mouthY");
  self->_mouthY = v13;
  self->_hasSmile = objc_msgSend(v4, "hasSmile");
  objc_msgSend(v4, "blurScore");
  self->_blurScore = v14;
  self->_isLeftEyeClosed = objc_msgSend(v4, "isLeftEyeClosed");
  self->_isRightEyeClosed = objc_msgSend(v4, "isRightEyeClosed");
  objc_msgSend(v4, "poseYaw");
  self->_poseYaw = v15;
  self->_faceAlgorithmVersion = objc_msgSend(v4, "faceAlgorithmVersion");
  self->_qualityMeasure = objc_msgSend(v4, "qualityMeasure");
  self->_isTooSmall = objc_msgSend(v4, "isTooSmall");
  objc_msgSend(v4, "groupingIdentifier");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  groupingIdentifier = self->_groupingIdentifier;
  self->_groupingIdentifier = v16;

  self->_ageType = (NSString *)(id)objc_msgSend(v4, "ageType");
  self->_sexType = (NSString *)(id)objc_msgSend(v4, "sexType");
  self->_eyesState = (NSString *)(id)objc_msgSend(v4, "eyesState");
  self->_smileType = (NSString *)(id)objc_msgSend(v4, "smileType");
  self->_facialHairType = (NSString *)(id)objc_msgSend(v4, "facialHairType");
  self->_hairColorType = (NSString *)(id)objc_msgSend(v4, "hairColorType");
  self->_baldType = (NSString *)(id)objc_msgSend(v4, "baldType");
  self->_glassesType = (NSString *)(id)objc_msgSend(v4, "glassesType");
  self->_eyeMakeupType = (NSString *)(id)objc_msgSend(v4, "eyeMakeupType");
  self->_lipMakeupType = (NSString *)(id)objc_msgSend(v4, "lipMakeupType");
  objc_msgSend(v4, "roll");
  self->_roll = v18;
  objc_msgSend(v4, "quality");
  v20 = v19;

  self->_quality = v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)PVFace;
  -[PVObject description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("  clusterSequenceNumber  : %ld\n"), self->_clusterSequenceNumber);
  objc_msgSend(v5, "appendFormat:", CFSTR("  personLocalIdentifier  : %@\n"), self->_personLocalIdentifier);
  objc_msgSend(v5, "appendFormat:", CFSTR("  nameSource             : %ld\n"), self->_nameSource);
  objc_msgSend(v5, "appendFormat:", CFSTR("  trainingType           : %ld\n"), self->_trainingType);
  objc_msgSend(v5, "appendFormat:", CFSTR("  manual                 : %d\n"), self->_manual);
  objc_msgSend(v5, "appendFormat:", CFSTR("  hidden                 : %d\n"), self->_hidden);
  objc_msgSend(v5, "appendFormat:", CFSTR("  isInTrash              : %d\n"), self->_isInTrash);
  objc_msgSend(v5, "appendFormat:", CFSTR("  isTooSmall             : %d\n"), self->_isTooSmall);
  objc_msgSend(v5, "appendFormat:", CFSTR("  faceprint              : %p\n"), self->_faceprint);
  objc_msgSend(v5, "appendFormat:", CFSTR("  adjustmentVersion      : %@\n"), self->_adjustmentVersion);
  objc_msgSend(v5, "appendFormat:", CFSTR("  sourceWidth            : %ld\n"), self->_sourceWidth);
  objc_msgSend(v5, "appendFormat:", CFSTR("  sourceHeight           : %ld\n"), self->_sourceHeight);
  objc_msgSend(v5, "appendFormat:", CFSTR("  centerX                : %f\n"), *(_QWORD *)&self->_centerX);
  objc_msgSend(v5, "appendFormat:", CFSTR("  centerY                : %f\n"), *(_QWORD *)&self->_centerY);
  objc_msgSend(v5, "appendFormat:", CFSTR("  size                   : %f\n"), *(_QWORD *)&self->_size);
  objc_msgSend(v5, "appendFormat:", CFSTR("  leftEyeX               : %f\n"), *(_QWORD *)&self->_leftEyeX);
  objc_msgSend(v5, "appendFormat:", CFSTR("  leftEyeY               : %f\n"), *(_QWORD *)&self->_leftEyeY);
  objc_msgSend(v5, "appendFormat:", CFSTR("  rightEyeX              : %f\n"), *(_QWORD *)&self->_rightEyeX);
  objc_msgSend(v5, "appendFormat:", CFSTR("  rightEyeY              : %f\n"), *(_QWORD *)&self->_rightEyeY);
  objc_msgSend(v5, "appendFormat:", CFSTR("  mouthX                 : %f\n"), *(_QWORD *)&self->_mouthX);
  objc_msgSend(v5, "appendFormat:", CFSTR("  mouthY                 : %f\n"), *(_QWORD *)&self->_mouthY);
  objc_msgSend(v5, "appendFormat:", CFSTR("  hasSmile               : %d\n"), self->_hasSmile);
  objc_msgSend(v5, "appendFormat:", CFSTR("  blurScore              : %f\n"), *(_QWORD *)&self->_blurScore);
  objc_msgSend(v5, "appendFormat:", CFSTR("  isLeftEyeClosed        : %d\n"), self->_isLeftEyeClosed);
  objc_msgSend(v5, "appendFormat:", CFSTR("  isRightEyeClosed       : %d\n"), self->_isRightEyeClosed);
  objc_msgSend(v5, "appendFormat:", CFSTR("  poseYaw                : %f\n"), *(_QWORD *)&self->_poseYaw);
  objc_msgSend(v5, "appendFormat:", CFSTR("  faceAlgorithmVersion   : %lu\n"), self->_faceAlgorithmVersion);
  objc_msgSend(v5, "appendFormat:", CFSTR("  qualityMeasure         : %ld\n"), self->_qualityMeasure);
  objc_msgSend(v5, "appendFormat:", CFSTR("  groupingIdentifier     : %@\n"), self->_groupingIdentifier);
  return v5;
}

- (BOOL)setCenterAndSizeFromNormalizedFaceRect:(CGRect)a3
{
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v5 = 0.0;
  PVFaceGetCenterAndSizeForNormalizedRect(self->_sourceWidth, self->_sourceHeight, &v7, &v6, &v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_centerX = v7;
  self->_centerY = v6;
  self->_size = v5;
  return 1;
}

- (CGRect)normalizedFaceRect
{
  double size;
  int64_t sourceWidth;
  int64_t sourceHeight;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  size = self->_size;
  sourceWidth = self->_sourceWidth;
  sourceHeight = self->_sourceHeight;
  if (sourceWidth <= sourceHeight)
    v5 = self->_sourceHeight;
  else
    v5 = self->_sourceWidth;
  v6 = size * (double)v5;
  v7 = v6 / (double)sourceWidth;
  v8 = v6 / (double)sourceHeight;
  v9 = 1.0;
  if (size <= 1.0)
    v9 = self->_size;
  v10 = self->_centerX - v7 * 0.5;
  v11 = self->_centerY - v8 * 0.5;
  if (v10 < 0.0)
    v10 = 0.0;
  if (v11 < 0.0)
    v11 = 0.0;
  v12 = v9;
  result.size.height = v12;
  result.size.width = v9;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)absoluteFaceRect
{
  unint64_t sourceWidth;
  unint64_t sourceHeight;
  int64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  sourceWidth = self->_sourceWidth;
  sourceHeight = self->_sourceHeight;
  if (sourceWidth <= sourceHeight)
    v4 = self->_sourceHeight;
  else
    v4 = self->_sourceWidth;
  v5 = self->_size * (double)(unint64_t)v4;
  v6 = -(v5 * 0.5 - self->_centerX * (double)sourceWidth);
  v7 = (double)sourceHeight - self->_centerY * (double)sourceHeight - v5 * 0.5;
  v8 = v5;
  result.size.height = v8;
  result.size.width = v5;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)absoluteFaceRectForImageSize:(CGSize)a3
{
  unint64_t width;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  width = (unint64_t)a3.width;
  if ((unint64_t)a3.width <= (unint64_t)a3.height)
    width = (unint64_t)a3.height;
  v4 = self->_size * (double)width;
  v5 = -(v4 * 0.5 - self->_centerX * (double)(unint64_t)a3.width);
  v6 = (double)(unint64_t)a3.height - self->_centerY * (double)(unint64_t)a3.height - v4 * 0.5;
  v7 = v4;
  result.size.height = v7;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (void)setPersonLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)sourceWidth
{
  return self->_sourceWidth;
}

- (void)setSourceWidth:(int64_t)a3
{
  self->_sourceWidth = a3;
}

- (int64_t)sourceHeight
{
  return self->_sourceHeight;
}

- (void)setSourceHeight:(int64_t)a3
{
  self->_sourceHeight = a3;
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setCenterX:(double)a3
{
  self->_centerX = a3;
}

- (double)centerY
{
  return self->_centerY;
}

- (void)setCenterY:(double)a3
{
  self->_centerY = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (double)leftEyeX
{
  return self->_leftEyeX;
}

- (void)setLeftEyeX:(double)a3
{
  self->_leftEyeX = a3;
}

- (double)leftEyeY
{
  return self->_leftEyeY;
}

- (void)setLeftEyeY:(double)a3
{
  self->_leftEyeY = a3;
}

- (double)rightEyeX
{
  return self->_rightEyeX;
}

- (void)setRightEyeX:(double)a3
{
  self->_rightEyeX = a3;
}

- (double)rightEyeY
{
  return self->_rightEyeY;
}

- (void)setRightEyeY:(double)a3
{
  self->_rightEyeY = a3;
}

- (double)mouthX
{
  return self->_mouthX;
}

- (void)setMouthX:(double)a3
{
  self->_mouthX = a3;
}

- (double)mouthY
{
  return self->_mouthY;
}

- (void)setMouthY:(double)a3
{
  self->_mouthY = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isInTrash
{
  return self->_isInTrash;
}

- (void)setIsInTrash:(BOOL)a3
{
  self->_isInTrash = a3;
}

- (BOOL)manual
{
  return self->_manual;
}

- (void)setManual:(BOOL)a3
{
  self->_manual = a3;
}

- (BOOL)isTooSmall
{
  return self->_isTooSmall;
}

- (void)setIsTooSmall:(BOOL)a3
{
  self->_isTooSmall = a3;
}

- (BOOL)hasSmile
{
  return self->_hasSmile;
}

- (void)setHasSmile:(BOOL)a3
{
  self->_hasSmile = a3;
}

- (double)blurScore
{
  return self->_blurScore;
}

- (void)setBlurScore:(double)a3
{
  self->_blurScore = a3;
}

- (double)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(double)a3
{
  self->_exposureScore = a3;
}

- (BOOL)isLeftEyeClosed
{
  return self->_isLeftEyeClosed;
}

- (void)setIsLeftEyeClosed:(BOOL)a3
{
  self->_isLeftEyeClosed = a3;
}

- (BOOL)isRightEyeClosed
{
  return self->_isRightEyeClosed;
}

- (void)setIsRightEyeClosed:(BOOL)a3
{
  self->_isRightEyeClosed = a3;
}

- (NSString)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)nameSource
{
  return self->_nameSource;
}

- (void)setNameSource:(int64_t)a3
{
  self->_nameSource = a3;
}

- (int)trainingType
{
  return self->_trainingType;
}

- (void)setTrainingType:(int)a3
{
  self->_trainingType = a3;
}

- (double)poseYaw
{
  return self->_poseYaw;
}

- (void)setPoseYaw:(double)a3
{
  self->_poseYaw = a3;
}

- (int64_t)faceAlgorithmVersion
{
  return self->_faceAlgorithmVersion;
}

- (void)setFaceAlgorithmVersion:(int64_t)a3
{
  self->_faceAlgorithmVersion = a3;
}

- (int64_t)clusterSequenceNumber
{
  return self->_clusterSequenceNumber;
}

- (void)setClusterSequenceNumber:(int64_t)a3
{
  self->_clusterSequenceNumber = a3;
}

- (int64_t)qualityMeasure
{
  return self->_qualityMeasure;
}

- (void)setQualityMeasure:(int64_t)a3
{
  self->_qualityMeasure = a3;
}

- (NSString)ageType
{
  return self->_ageType;
}

- (void)setAgeType:(id)a3
{
  self->_ageType = (NSString *)a3;
}

- (NSString)sexType
{
  return self->_sexType;
}

- (void)setSexType:(id)a3
{
  self->_sexType = (NSString *)a3;
}

- (NSString)eyesState
{
  return self->_eyesState;
}

- (void)setEyesState:(id)a3
{
  self->_eyesState = (NSString *)a3;
}

- (NSString)smileType
{
  return self->_smileType;
}

- (void)setSmileType:(id)a3
{
  self->_smileType = (NSString *)a3;
}

- (NSString)facialHairType
{
  return self->_facialHairType;
}

- (void)setFacialHairType:(id)a3
{
  self->_facialHairType = (NSString *)a3;
}

- (NSString)hairColorType
{
  return self->_hairColorType;
}

- (void)setHairColorType:(id)a3
{
  self->_hairColorType = (NSString *)a3;
}

- (NSString)baldType
{
  return self->_baldType;
}

- (void)setBaldType:(id)a3
{
  self->_baldType = (NSString *)a3;
}

- (NSString)glassesType
{
  return self->_glassesType;
}

- (void)setGlassesType:(id)a3
{
  self->_glassesType = (NSString *)a3;
}

- (NSString)eyeMakeupType
{
  return self->_eyeMakeupType;
}

- (void)setEyeMakeupType:(id)a3
{
  self->_eyeMakeupType = (NSString *)a3;
}

- (NSString)lipMakeupType
{
  return self->_lipMakeupType;
}

- (void)setLipMakeupType:(id)a3
{
  self->_lipMakeupType = (NSString *)a3;
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setGroupingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (PVFaceprint)faceprint
{
  return self->_faceprint;
}

- (void)setFaceprint:(id)a3
{
  objc_storeStrong((id *)&self->_faceprint, a3);
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

- (double)quality
{
  return self->_quality;
}

- (void)setQuality:(double)a3
{
  self->_quality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

+ (PVFace)faceWithFace:(id)a3 copyPropertiesOption:(int64_t)a4
{
  id v5;
  PVFace *v6;
  void *v7;
  PVFace *v8;

  v5 = a3;
  v6 = [PVFace alloc];
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PVObject initWithLocalIdentifier:](v6, "initWithLocalIdentifier:", v7);

  -[PVFace _copyPropertiesFrom:copyPropertiesOption:](v8, "_copyPropertiesFrom:copyPropertiesOption:", v5, a4);
  return v8;
}

@end
