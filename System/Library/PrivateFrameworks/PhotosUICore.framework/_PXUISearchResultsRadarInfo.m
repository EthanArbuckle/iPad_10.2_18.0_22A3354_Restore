@implementation _PXUISearchResultsRadarInfo

- (NSString)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(id)a3
{
  objc_storeStrong((id *)&self->_componentID, a3);
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->_componentName, a3);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_componentVersion, a3);
}

- (NSString)radarClassification
{
  return self->_radarClassification;
}

- (void)setRadarClassification:(id)a3
{
  objc_storeStrong((id *)&self->_radarClassification, a3);
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
  objc_storeStrong((id *)&self->_radarTitle, a3);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_storeStrong((id *)&self->_radarDescription, a3);
}

- (NSString)radarKeyword
{
  return self->_radarKeyword;
}

- (void)setRadarKeyword:(id)a3
{
  objc_storeStrong((id *)&self->_radarKeyword, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarKeyword, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_radarClassification, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
}

@end
