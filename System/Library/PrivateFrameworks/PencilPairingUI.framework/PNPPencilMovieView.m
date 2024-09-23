@implementation PNPPencilMovieView

void __61___PNPPencilMovieView_completeRevolutionWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  double Seconds;
  void *v4;
  double v5;
  double v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  CMTime v10;
  CMTime time;
  CMTime v12;

  memset(&v12, 0, sizeof(v12));
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
    objc_msgSend(v2, "duration");
  time = v12;
  Seconds = CMTimeGetSeconds(&time);
  memset(&time, 0, sizeof(time));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
    objc_msgSend(v4, "currentTime");
  v10 = time;
  v5 = CMTimeGetSeconds(&v10);
  if (v5 >= Seconds * 0.25)
    v6 = Seconds - v5;
  else
    v6 = -v5;
  v7 = dispatch_time(0, (uint64_t)(fmin((Seconds * 0.25 + v6) * (1.0 / *(float *)(a1 + 48)), 2.4) * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___PNPPencilMovieView_completeRevolutionWithCompletionBlock___block_invoke_2;
  block[3] = &unk_24F4E5188;
  v9 = *(id *)(a1 + 32);
  dispatch_after(v7, MEMORY[0x24BDAC9B8], block);

}

uint64_t __61___PNPPencilMovieView_completeRevolutionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
