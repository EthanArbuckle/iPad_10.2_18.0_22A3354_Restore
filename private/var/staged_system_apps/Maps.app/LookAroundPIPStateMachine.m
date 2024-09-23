@implementation LookAroundPIPStateMachine

- (BOOL)isActive
{
  return self->_state != 0;
}

- (BOOL)isCancellingPendingMove
{
  return self->_state == 1;
}

- (BOOL)isMoving
{
  return self->_state == 3;
}

- (BOOL)isPanning
{
  return self->_state == 4;
}

- (BOOL)canSetStateTo:(unint64_t)a3
{
  BOOL result;
  unint64_t v4;
  BOOL v5;
  unsigned int v6;
  BOOL v7;
  unint64_t state;

  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      return 1;
    case 1uLL:
      v7 = self->_state == 3;
      goto LABEL_13;
    case 3uLL:
      state = self->_state;
      v7 = state == 2 || state == 4;
      goto LABEL_13;
    case 4uLL:
    case 5uLL:
      v4 = self->_state;
      v5 = v4 >= 7;
      v6 = (0x46u >> v4) & 1;
      if (v5)
        return 0;
      else
        return v6;
    case 6uLL:
      v7 = self->_state == 5;
      goto LABEL_13;
    case 7uLL:
      v7 = self->_state == 6;
LABEL_13:
      result = v7;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)setStateTo:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t state;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;

  if (-[LookAroundPIPStateMachine canSetStateTo:](self, "canSetStateTo:"))
  {
    if (a3 && self->_showStateChanges)
    {
      v5 = sub_100431B9C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        state = self->_state;
        if (state > 7)
          v8 = &stru_1011EB268;
        else
          v8 = off_1011E1A90[state];
        if (a3 > 7)
          v9 = &stru_1011EB268;
        else
          v9 = off_1011E1A58[a3 - 1];
        v10 = 138412546;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "State: %@ -> %@", (uint8_t *)&v10, 0x16u);
      }

    }
    self->_state = a3;
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)showStateChanges
{
  return self->_showStateChanges;
}

- (void)setShowStateChanges:(BOOL)a3
{
  self->_showStateChanges = a3;
}

@end
