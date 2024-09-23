@implementation VIACacheHitEvent

- (VIACacheHitEvent)initWithContext:(id)a3
{
  id v5;
  VIACacheHitEvent *v6;
  VIACacheHitEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIACacheHitEvent;
  v6 = -[VIACacheHitEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (unint64_t)queryID
{
  return -[VIACacheHitContext queryID](self->_context, "queryID");
}

- (unint64_t)cachedResultQueryID
{
  return -[VIACacheHitContext cachedResultQueryID](self->_context, "cachedResultQueryID");
}

- (NSString)originatingApplication
{
  return -[VIACacheHitContext applicationIdentifier](self->_context, "applicationIdentifier");
}

- (BOOL)shouldReportDirectly
{
  return 0;
}

- (NSString)engagementSuggestionType
{
  return -[VIACacheHitContext engagementSuggestionType](self->_context, "engagementSuggestionType");
}

- (id)feedback
{
  return objc_alloc_init(VIACacheHitEventFeedback);
}

- (VIACacheHitContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
