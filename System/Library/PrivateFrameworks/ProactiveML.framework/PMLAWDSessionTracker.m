@implementation PMLAWDSessionTracker

+ (id)trackerForModelName:(id)a3 modelVersion:(id)a4
{
  return (id)objc_msgSend(a1, "trackerForModelName:modelVersion:modelLocale:", a3, a4, CFSTR("unknown"));
}

- (void)trackSessionWithCovariates:(id)a3 label:(unint64_t)a4 locale:(id)a5
{
  -[PMLAWDSessionTracker trackSessionWithCovariates:label:locale:supervisionType:](self, "trackSessionWithCovariates:label:locale:supervisionType:", a3, a4, a5, 0);
}

- (void)trackSessionWithCovariates:(id)a3 label:(unint64_t)a4 locale:(id)a5 supervisionType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a5;
  v11 = a3;
  v16 = (id)objc_opt_new();
  -[PMLAWDBaseTracker modelInfo](self, "modelInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v16, "setModelInfo:", v13);

  objc_msgSend(v16, "modelInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocale:", v10);

  +[AWDProactiveModelFittingSparseFloatVector sparseFloatVectorFromSparseVector:](AWDProactiveModelFittingSparseFloatVector, "sparseFloatVectorFromSparseVector:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setSparseFloatFeatures:", v15);
  objc_msgSend(v16, "setLabel:", a4);
  objc_msgSend(v16, "setSupervisionType:", a6);
  -[PMLAWDBaseTracker postMetricId:message:](self, "postMetricId:message:", 5636097, v16);

}

@end
