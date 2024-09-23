@implementation APSigningObservabilityCorrespondent

- (APSigningObservabilityCorrespondent)init
{
  APSigningObservabilityCorrespondent *v2;
  _TtC7Metrics42APSigningObservabilityCorrespondentWrapper *v3;
  _TtC7Metrics42APSigningObservabilityCorrespondentWrapper *wrapper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APSigningObservabilityCorrespondent;
  v2 = -[APSigningObservabilityCorrespondent init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(_TtC7Metrics42APSigningObservabilityCorrespondentWrapper);
    wrapper = v2->_wrapper;
    v2->_wrapper = v3;

  }
  return v2;
}

- (void)submitReport
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[APSigningObservabilityCorrespondent wrapper](self, "wrapper"));
  objc_msgSend(v2, "submitReport");

}

- (_TtC7Metrics42APSigningObservabilityCorrespondentWrapper)wrapper
{
  return self->_wrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end
