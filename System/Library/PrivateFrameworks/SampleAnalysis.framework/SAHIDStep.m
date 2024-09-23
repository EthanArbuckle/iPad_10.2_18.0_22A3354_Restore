@implementation SAHIDStep

+ (SAHIDStep)hidStepWithDebugId:(int)a3 pid:(unint64_t)a4 tid:
{
  SAHIDStep *v7;

  objc_opt_self();
  v7 = objc_alloc_init(SAHIDStep);
  v7->_debugid = a2;
  v7->_pid = a3;
  v7->_tid = a4;
  return v7;
}

- (NSString)debugidString
{
  signed int debugid;
  __CFString *v3;

  debugid = self->_debugid;
  if (debugid <= 736428043)
  {
    if (debugid <= 730268059)
    {
      if (debugid > 730267907)
      {
        if (debugid == 730267908)
        {
          v3 = CFSTR("UIKit HID callback start");
          return (NSString *)v3;
        }
        if (debugid == 730268056)
        {
          v3 = CFSTR("Keyboard event start");
          return (NSString *)v3;
        }
      }
      else
      {
        if (debugid == 730267892)
        {
          v3 = CFSTR("Event dispatch begin");
          return (NSString *)v3;
        }
        if (debugid == 730267896)
        {
          v3 = CFSTR("Event dispatch end");
          return (NSString *)v3;
        }
      }
    }
    else if (debugid <= 735576101)
    {
      if (debugid == 730268060)
      {
        v3 = CFSTR("Keyboard event stop");
        return (NSString *)v3;
      }
      if (debugid == 735576101)
      {
        v3 = CFSTR("Entry to NSApplication sendEvent");
        return (NSString *)v3;
      }
    }
    else
    {
      switch(debugid)
      {
        case 735576102:
          v3 = CFSTR("Return from NSApplication sendEvent");
          return (NSString *)v3;
        case 736428036:
          v3 = CFSTR("hid_translation_state_append_wrapped_nxevent");
          return (NSString *)v3;
        case 736428040:
          v3 = CFSTR("CGXGetNextEvent");
          return (NSString *)v3;
      }
    }
LABEL_46:
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UNKNOWN(0x%x)"), self->_debugid);
    return (NSString *)v3;
  }
  if (debugid > 736428063)
  {
    if (debugid <= 736493575)
    {
      if (debugid == 736428064)
      {
        v3 = CFSTR("decode_and_forward");
        return (NSString *)v3;
      }
      if (debugid == 736493572)
      {
        v3 = CFSTR("PushToCGEventQueue");
        return (NSString *)v3;
      }
    }
    else
    {
      switch(debugid)
      {
        case 736493576:
          v3 = CFSTR("CreateAndPostEventWithCGEvent");
          return (NSString *)v3;
        case 736493580:
          v3 = CFSTR("PullEventsFromWindowServerOnConnection");
          return (NSString *)v3;
        case 736493584:
          v3 = CFSTR("ReceiveNextEventCommon (for the next event)");
          return (NSString *)v3;
      }
    }
    goto LABEL_46;
  }
  if (debugid <= 736428051)
  {
    if (debugid == 736428044)
    {
      v3 = CFSTR("sHIDContinuation");
      return (NSString *)v3;
    }
    if (debugid == 736428048)
    {
      v3 = CFSTR("sPostContinuation");
      return (NSString *)v3;
    }
    goto LABEL_46;
  }
  if (debugid == 736428052)
  {
    v3 = CFSTR("sAnnotatedContinuation");
    return (NSString *)v3;
  }
  if (debugid == 736428056)
  {
    v3 = CFSTR("CGXFilterEventToConnection");
    return (NSString *)v3;
  }
  if (debugid != 736428060)
    goto LABEL_46;
  v3 = CFSTR("post_event_tap_data");
  return (NSString *)v3;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  uint64_t debugid;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SATimestamp debugDescription](self->_timestamp, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  debugid = self->_debugid;
  -[SAHIDStep debugidString](self, "debugidString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %#10x (%@) [%d] thread 0x%llx"), v4, debugid, v6, self->_pid, self->_tid);

  return v7;
}

- (unsigned)debugid
{
  return self->_debugid;
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)tid
{
  return self->_tid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
