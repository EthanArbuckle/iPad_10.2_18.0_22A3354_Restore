@implementation PSMetricsManager

+ (void)recordWithAppInference:(id)a3
{
  id v3;

  objc_msgSend(a3, "underlyingObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[_PSMetricsManagerInternal recordWithInference:](_PSMetricsManagerInternal, "recordWithInference:", v3);

}

+ (void)recordWithFeedback:(id)a3
{
  id v3;

  objc_msgSend(a3, "underlyingObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[_PSMetricsManagerInternal recordWithFeedback:](_PSMetricsManagerInternal, "recordWithFeedback:", v3);

}

+ (void)recordWithPeopleInference:(id)a3
{
  id v3;

  objc_msgSend(a3, "underlyingObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[_PSMetricsManagerInternal recordWithInference:](_PSMetricsManagerInternal, "recordWithInference:", v3);

}

- (_PSMetricsManagerInternal)underlyingObject
{
  return (_PSMetricsManagerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
