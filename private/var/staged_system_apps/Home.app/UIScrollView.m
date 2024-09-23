@implementation UIScrollView

- (void)_performTranslationScrollTest:(id)a3 duration:(double)a4 iterations:(int)a5 scrollAxis:(unint64_t)a6
{
  uint64_t v7;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  -[UIScrollView contentSize](self, "contentSize");
  if (a6 == 1)
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    v13 = v12;
    -[UIScrollView contentSize](self, "contentSize");
    if (v13 >= v14 * 0.5)
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      v18 = -v20;
    }
    else
    {
      -[UIScrollView contentSize](self, "contentSize");
      v16 = v15;
      -[UIScrollView contentOffset](self, "contentOffset");
      v18 = v16 - v17;
    }
    v19 = 0.0;
  }
  else
  {
    v19 = v11;
    v18 = 0.0;
  }
  if (a4 == -1.0)
  {
    v21 = fabs(v18) + fabs(v19);
    a4 = v21 / 400.0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v22, "startedTest:", v10);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView _simulateScrollWithTranslation:numIterations:duration:reversed:](self, "_simulateScrollWithTranslation:numIterations:duration:reversed:", v7, 0, v18, v19, a4));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002B5BC;
  v26[3] = &unk_1000B60A8;
  v27 = v10;
  v24 = v10;
  v25 = objc_msgSend(v23, "addSuccessBlock:", v26);

}

- (id)_simulateScrollWithTranslation:(CGPoint)a3 numIterations:(int)a4 duration:(double)a5 reversed:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  NAFuture *v12;
  double v13;
  double v14;
  NAFuture *v15;
  void *v16;
  _QWORD v18[8];
  int v19;
  BOOL v20;
  _QWORD v21[4];
  NAFuture *v22;
  _QWORD v23[4];
  NAFuture *v24;

  if (a4 <= 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult", a3.x, a3.y, a5));
  }
  else
  {
    v6 = a6;
    y = a3.y;
    x = a3.x;
    v12 = objc_opt_new(NAFuture);
    if (v6)
      v13 = -x;
    else
      v13 = x;
    if (v6)
      v14 = -y;
    else
      v14 = y;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002B788;
    v23[3] = &unk_1000B6DB8;
    v24 = v12;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002B79C;
    v21[3] = &unk_1000B5A50;
    v22 = v24;
    v15 = v24;
    -[UIScrollView _simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:](self, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:", &stru_1000B6D90, v23, &stru_1000B6DD8, v21, v13, v14, a5);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002B7A4;
    v18[3] = &unk_1000B6E00;
    v18[4] = self;
    *(double *)&v18[5] = x;
    *(double *)&v18[6] = y;
    v19 = a4;
    *(double *)&v18[7] = a5;
    v20 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NAFuture flatMap:](v15, "flatMap:", v18));

  }
  return v16;
}

@end
