@implementation PGMusicCurationAndFeatures

- (PGMusicCurationAndFeatures)initWithAppleMusicCuration:(id)a3 features:(id)a4
{
  id v7;
  id v8;
  PGMusicCurationAndFeatures *v9;
  PGMusicCurationAndFeatures *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMusicCurationAndFeatures;
  v9 = -[PGMusicCurationAndFeatures init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleMusicCuration, a3);
    objc_storeStrong((id *)&v10->_features, a4);
  }

  return v10;
}

- (PGMusicCurationAndFeatures)initWithFlexMusicCuration:(id)a3 features:(id)a4
{
  id v7;
  id v8;
  PGMusicCurationAndFeatures *v9;
  PGMusicCurationAndFeatures *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMusicCurationAndFeatures;
  v9 = -[PGMusicCurationAndFeatures init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flexMusicCuration, a3);
    objc_storeStrong((id *)&v10->_features, a4);
  }

  return v10;
}

- (PGMusicCuration)appleMusicCuration
{
  return (PGMusicCuration *)objc_getProperty(self, a2, 8, 1);
}

- (PGFlexMusicCuration)flexMusicCuration
{
  return (PGFlexMusicCuration *)objc_getProperty(self, a2, 16, 1);
}

- (PGMusicCurationFeatures)features
{
  return (PGMusicCurationFeatures *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_flexMusicCuration, 0);
  objc_storeStrong((id *)&self->_appleMusicCuration, 0);
}

@end
