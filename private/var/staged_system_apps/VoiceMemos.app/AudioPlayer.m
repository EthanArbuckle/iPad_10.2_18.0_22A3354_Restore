@implementation AudioPlayer

- (int)fillNextBuffer:(AudioBufferList *)a3 frameCount:(int)a4
{
  int v7;

  swift_retain(self);
  v7 = AudioPlayer.fillNextBuffer(_:frameCount:)(a3, a4);
  swift_release(self);
  return v7;
}

- (id)audioEngineOutputNodeAccessQueue
{
  uint64_t Strong;
  void *v4;
  id v5;

  Strong = swift_unknownObjectWeakLoadStrong(&self->delegate[7]);
  if (Strong)
  {
    v4 = (void *)Strong;
    swift_retain(self);
    v5 = objc_msgSend(v4, "audioEngineOutputNodeAccessQueue");
    swift_release(self);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)audioRendererQueueEmpty
{
  sub_1000A84FC((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))AudioPlayer.audioRendererQueueEmpty());
}

- (void)audioRendererError:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  id v8;

  Strong = swift_unknownObjectWeakLoadStrong(&self->delegate[7]);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    swift_retain(self);
    v8 = (id)_convertErrorToNSError(_:)(v7);
    objc_msgSend(v6, "audioPlayerError:", v8);
    swift_release(self);

    swift_unknownObjectRelease(v6);
  }
}

- (void)audioRendererWasInterrupted
{
  sub_1000A84FC((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))AudioPlayer.audioRendererWasInterrupted());
}

@end
