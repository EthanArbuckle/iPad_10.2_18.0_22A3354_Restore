@implementation TurnByTurnRouteAttributesBuilder

- (TurnByTurnRouteAttributesBuilder)initWithUseMetricSystem:(BOOL)a3
{
  TurnByTurnRouteAttributesBuilder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TurnByTurnRouteAttributesBuilder;
  result = -[TurnByTurnRouteAttributesBuilder init](&v5, "init");
  if (result)
    result->_useMetricSystem = a3;
  return result;
}

- (void)fillRouteAttributes:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setIncludeContingencyRoutes:", 1);
  objc_msgSend(v4, "setIncludePhonetics:", 1);
  objc_msgSend(v4, "setUseMetricThreshold:", -[TurnByTurnRouteAttributesBuilder useMetricSystem](self, "useMetricSystem"));

}

- (BOOL)useMetricSystem
{
  return self->_useMetricSystem;
}

@end
