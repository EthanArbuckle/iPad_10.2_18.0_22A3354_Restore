@implementation PGPastSupersetGroup

- (PGGraphMomentNodeCollection)momentNodes
{
  return (PGGraphMomentNodeCollection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMomentNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PGGraphLocationCityNodeCollection)supersetCityNodes
{
  return (PGGraphLocationCityNodeCollection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSupersetCityNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PGGraphLocationNodeCollection)densestCloseLocationNodes
{
  return (PGGraphLocationNodeCollection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDensestCloseLocationNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PGGraphLocationStateNodeCollection)stateNodeAsCollection
{
  return (PGGraphLocationStateNodeCollection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStateNodeAsCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_densestCloseLocationNodes, 0);
  objc_storeStrong((id *)&self->_supersetCityNodes, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
}

+ (id)pastSupersetGroupWithMomentNodes:(id)a3 dateInterval:(id)a4 supersetCityNodeAsCollection:(id)a5 densestCloseLocationNodeAsCollection:(id)a6 locationHelper:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setMomentNodes:", v15);

  objc_msgSend(v16, "setDateInterval:", v14);
  objc_msgSend(v16, "setSupersetCityNodes:", v13);
  objc_msgSend(v16, "setDensestCloseLocationNodes:", v12);

  objc_msgSend(v11, "stateNodeFromCityNodeAsCollection:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setStateNodeAsCollection:", v17);
  return v16;
}

@end
