@implementation _UIUpdateHIDInput

- (__IOHIDEvent)stopEventForModelTime:(unint64_t)a3 alignment:(int)a4
{
  return 0;
}

- (void)removeEvent:(__IOHIDEvent *)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->_events, "removeObjectIdenticalTo:", a3);
  if (!-[NSMutableArray count](self->_events, "count"))
  {
    if (self->_input._state.mode)
    {
      self->_input._state.mode = 0;
      _UIUpdateInputSetInputChanged(self->_input._set, (uint64_t)&self->_input);
    }
  }
}

- (void)addEvent:(__IOHIDEvent *)a3
{
  -[NSMutableArray addObject:](self->_events, "addObject:", a3);
  if (self->_input._state.mode != 2)
  {
    self->_input._state.mode = 2;
    _UIUpdateInputSetInputChanged(self->_input._set, (uint64_t)&self->_input);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
}

@end
