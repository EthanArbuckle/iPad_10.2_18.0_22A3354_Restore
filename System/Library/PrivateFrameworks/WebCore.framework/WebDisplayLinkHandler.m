@implementation WebDisplayLinkHandler

- (WebDisplayLinkHandler)initWithMonitor:(void *)a3
{
  WebDisplayLinkHandler *v4;
  WebDisplayLinkHandler *v5;
  CADisplayLink *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebDisplayLinkHandler;
  v4 = -[WebDisplayLinkHandler init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->m_monitor = a3;
    v6 = (CADisplayLink *)objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v4, sel_handleDisplayLink_);
    v5->m_displayLink = v6;
    -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", WebThreadNSRunLoop(), *MEMORY[0x1E0C99748]);
    -[CADisplayLink setPreferredFramesPerSecond:](v5->m_displayLink, "setPreferredFramesPerSecond:", 60);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebDisplayLinkHandler;
  -[WebDisplayLinkHandler dealloc](&v2, sel_dealloc);
}

- (void)handleDisplayLink:(id)a3
{
  _QWORD *m_monitor;

  m_monitor = self->m_monitor;
  (*(void (**)(_QWORD *, _QWORD *, id))(*m_monitor + 40))(m_monitor, m_monitor + 8, a3);
  m_monitor[8] = ((*((_DWORD *)m_monitor + 16) + 1) % *((_DWORD *)m_monitor + 17)) | ((unint64_t)*((unsigned int *)m_monitor + 17) << 32);
}

- (void)setPaused:(BOOL)a3
{
  -[CADisplayLink setPaused:](self->m_displayLink, "setPaused:", a3);
}

- (void)invalidate
{
  -[CADisplayLink invalidate](self->m_displayLink, "invalidate");
  self->m_displayLink = 0;
}

@end
