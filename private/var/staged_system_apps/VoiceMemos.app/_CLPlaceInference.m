@implementation _CLPlaceInference

+ (void)initialize
{
  void *v2;

  v2 = (void *)qword_1001ED8F8;
  qword_1001ED8F8 = (uint64_t)&off_1001B74F0;

}

- (CLLocation)location
{
  return (CLLocation *)-[_CLPlaceInference referenceLocation](self, "referenceLocation");
}

- (NSString)preferredName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_CLPlaceInference placemark](self, "placemark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  v7 = -[_CLPlaceInference userType](self, "userType");
  if (v7)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ED8F8, "objectAtIndexedSubscript:", v7));
    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subThoroughfare"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thoroughfare"));
  v12 = (void *)v11;
  v8 = 0;
  if (v10 && v11)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v10, v11));

LABEL_6:
  return (NSString *)v8;
}

@end
