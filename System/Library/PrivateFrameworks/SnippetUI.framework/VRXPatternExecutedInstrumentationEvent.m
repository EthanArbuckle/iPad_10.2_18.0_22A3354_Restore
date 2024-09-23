@implementation VRXPatternExecutedInstrumentationEvent

- (id)init:(id)a3 patternType:(id)a4 responseMode:(id)a5
{
  return -[VRXPatternExecutedInstrumentationEvent initWithPatternId:patternType:responseViewId:responseMode:](self, "initWithPatternId:patternType:responseViewId:responseMode:", a3, a4, 0, a5);
}

- (VRXPatternExecutedInstrumentationEvent)initWithPatternId:(id)a3 patternType:(id)a4 responseViewId:(id)a5 responseMode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  VRXPatternExecutedInstrumentationEvent *v14;
  _TtC9SnippetUI17RFPatternExecuted *v15;
  _TtC9SnippetUI17RFPatternExecuted *patternExecuted;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VRXPatternExecutedInstrumentationEvent;
  v14 = -[VRXPatternExecutedInstrumentationEvent init](&v18, sel_init);
  if (v14)
  {
    v15 = -[RFPatternExecuted initWithPatternId:patternType:responseViewId:responseMode:]([_TtC9SnippetUI17RFPatternExecuted alloc], "initWithPatternId:patternType:responseViewId:responseMode:", v10, v11, v12, v13);
    patternExecuted = v14->_patternExecuted;
    v14->_patternExecuted = v15;

  }
  return v14;
}

- (NSString)patternId
{
  return -[RFPatternExecuted patternId](self->_patternExecuted, "patternId");
}

- (NSString)patternType
{
  return -[RFPatternExecuted patternType](self->_patternExecuted, "patternType");
}

- (NSString)responseMode
{
  return -[RFPatternExecuted responseMode](self->_patternExecuted, "responseMode");
}

- (void)emitWithTurnIdentifier:(id)a3
{
  -[RFPatternExecuted emitWithTurnIdentifier:](self->_patternExecuted, "emitWithTurnIdentifier:", a3);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  -[RFPatternExecuted emitWithTurnIdentifier:aceViewId:](self->_patternExecuted, "emitWithTurnIdentifier:aceViewId:", a3, a4);
}

- (void)setPatternId:(id)a3
{
  objc_storeStrong((id *)&self->_patternId, a3);
}

- (void)setPatternType:(id)a3
{
  objc_storeStrong((id *)&self->_patternType, a3);
}

- (NSString)responseViewId
{
  return self->_responseViewId;
}

- (void)setResponseViewId:(id)a3
{
  objc_storeStrong((id *)&self->_responseViewId, a3);
}

- (void)setResponseMode:(id)a3
{
  objc_storeStrong((id *)&self->_responseMode, a3);
}

- (_TtC9SnippetUI17RFPatternExecuted)patternExecuted
{
  return (_TtC9SnippetUI17RFPatternExecuted *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternExecuted, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_responseViewId, 0);
  objc_storeStrong((id *)&self->_patternType, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
}

@end
