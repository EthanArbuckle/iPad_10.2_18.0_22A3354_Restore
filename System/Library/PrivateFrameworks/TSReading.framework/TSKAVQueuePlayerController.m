@implementation TSKAVQueuePlayerController

- (TSKAVQueuePlayerController)initWithQueuePlayer:(id)a3 delegate:(id)a4 assets:(id)a5
{
  return -[TSKAVQueuePlayerController initWithQueuePlayer:delegate:assets:initialAssetIndex:](self, "initWithQueuePlayer:delegate:assets:initialAssetIndex:", a3, a4, a5, 0);
}

- (TSKAVQueuePlayerController)initWithQueuePlayer:(id)a3 delegate:(id)a4 assets:(id)a5 initialAssetIndex:(unint64_t)a6
{
  TSKAVQueuePlayerController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSKAVQueuePlayerController;
  v9 = -[TSKAVPlayerController initWithPlayer:delegate:](&v11, sel_initWithPlayer_delegate_, a3, a4);
  if (v9)
  {
    v9->mAssets = (NSArray *)objc_msgSend(a5, "copy");
    objc_msgSend(a3, "setActionAtItemEnd:", 0);
    -[TSKAVQueuePlayerController p_enqueueAssetsFromIndex:](v9, "p_enqueueAssetsFromIndex:", a6);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKAVQueuePlayerController;
  -[TSKAVPlayerController dealloc](&v3, sel_dealloc);
}

- (void)playerItemDidPlayToEndTimeAtRate:(float)a3
{
  AVPlayer *v4;
  double v5;
  TSKAVQueuePlayerController *v6;
  double v7;

  v4 = -[TSKAVPlayerController player](self, "player");
  if (objc_msgSend((id)-[AVPlayer items](v4, "items"), "count") == 1)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKAVPlayerControllerDidPlayToEndNotification"), self);
    if (-[TSKAVPlayerController repeatMode](self, "repeatMode") == 1)
    {
      -[TSKAVQueuePlayerController p_enqueueAssetsFromIndex:](self, "p_enqueueAssetsFromIndex:", 0);
      *(float *)&v5 = a3;
      -[AVPlayer setRate:](v4, "setRate:", v5);
    }
    else
    {
      v6 = self;
      LODWORD(v7) = 0;
      -[AVPlayer setRate:](v4, "setRate:", v7);
      -[TSKAVPlayerControllerDelegate playbackDidStopForPlayerController:](-[TSKAVPlayerController delegate](self, "delegate"), "playbackDidStopForPlayerController:", self);

    }
  }
}

- (void)skipToAssetAtIndex:(unint64_t)a3
{
  -[TSKAVPlayerController setPlaying:](self, "setPlaying:", 0);
  -[AVPlayer removeAllItems](-[TSKAVPlayerController player](self, "player"), "removeAllItems");
  -[TSKAVQueuePlayerController p_enqueueAssetsFromIndex:](self, "p_enqueueAssetsFromIndex:", a3);
}

- (void)p_enqueueAssetsFromIndex:(unint64_t)a3
{
  AVPlayer *v5;
  NSUInteger v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSKAVPlayerController player](self, "player");
  v6 = -[NSArray count](self->mAssets, "count");
  if (v6 > a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = -[NSArray subarrayWithRange:](self->mAssets, "subarrayWithRange:", a3, v6 - a3, 0);
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[AVPlayer insertItem:afterItem:](v5, "insertItem:afterItem:", objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)), 0);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }
}

@end
