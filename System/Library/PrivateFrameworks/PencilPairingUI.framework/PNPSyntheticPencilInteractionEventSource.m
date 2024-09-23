@implementation PNPSyntheticPencilInteractionEventSource

- (BOOL)isPlaying
{
  return self->_playing && !self->_cancelled;
}

- (void)play
{
  self->_cancelled = 0;
  if (!self->_playing)
  {
    self->_playing = 1;
    -[PNPSyntheticPencilInteractionEventSource _playEventAtPlayheadPosition:](self, "_playEventAtPlayheadPosition:", 0);
  }
}

- (void)_playEventAtPlayheadPosition:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  -[PNPSyntheticPencilInteractionEventSource playlist](self, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNPSyntheticPencilInteractionEventSource eventDestination](self, "eventDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__PNPSyntheticPencilInteractionEventSource__playEventAtPlayheadPosition___block_invoke;
  v8[3] = &unk_24F4E51B0;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v6, "serviceDestination:fromSource:withCompletionBlock:", v7, self, v8);

}

uint64_t __73__PNPSyntheticPencilInteractionEventSource__playEventAtPlayheadPosition___block_invoke(uint64_t result)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(result + 32);
  if (!v1[9])
    return objc_msgSend(v1, "_playEventAtPlayheadPosition:", objc_msgSend(*(id *)(result + 32), "_playlistPositionForPosition:", *(_QWORD *)(result + 40) + 1));
  v1[8] = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
  return result;
}

- (id)_terminalEventsForPlayhead
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)stop
{
  self->_cancelled = 1;
}

- (NSArray)playlist
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (int64_t)_playlistPositionForPosition:(int64_t)a3
{
  void *v4;
  unint64_t v5;

  -[PNPSyntheticPencilInteractionEventSource playlist](self, "playlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  if (v5 >= a3)
    return a3;
  else
    return 0;
}

- (PNPPencilInteractionEventDestination)eventDestination
{
  return (PNPPencilInteractionEventDestination *)objc_loadWeakRetained((id *)&self->eventDestination);
}

- (void)setEventDestination:(id)a3
{
  objc_storeWeak((id *)&self->eventDestination, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->eventDestination);
}

@end
