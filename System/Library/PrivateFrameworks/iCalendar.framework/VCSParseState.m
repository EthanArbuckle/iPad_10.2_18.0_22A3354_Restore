@implementation VCSParseState

- (VCSParseState)init
{
  VCSParseState *v2;
  VCSParseState *v3;
  uint64_t v4;
  NSMutableArray *calendars;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VCSParseState;
  v2 = -[VCSParseState init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_context = xmmword_1D34840B0;
    v2->_lineNumber = 0;
    v2->_palmImport = 0;
    v2->_status = 0;
    v4 = objc_opt_new();
    calendars = v3->_calendars;
    v3->_calendars = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)setVersionMaj:(int)a3 andMin:(int)a4
{
  self->_version = 0;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int)lineNumber
{
  return self->_lineNumber;
}

- (void)setLineNumber:(int)a3
{
  self->_lineNumber = a3;
}

- (BOOL)palmImport
{
  return self->_palmImport;
}

- (void)setPalmImport:(BOOL)a3
{
  self->_palmImport = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (VCSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (VCSEntity)currentEntity
{
  return self->_currentEntity;
}

- (void)setCurrentEntity:(id)a3
{
  objc_storeStrong((id *)&self->_currentEntity, a3);
}

- (NSMutableArray)calendars
{
  return self->_calendars;
}

- (void)setCalendars:(id)a3
{
  objc_storeStrong((id *)&self->_calendars, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_currentEntity, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
}

@end
