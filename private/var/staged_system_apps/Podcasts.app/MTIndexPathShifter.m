@implementation MTIndexPathShifter

- (void)setInitialIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *shiftedIndexPath;

  v5 = (NSIndexPath *)a3;
  objc_storeStrong((id *)&self->_initialIndexPath, a3);
  shiftedIndexPath = self->_shiftedIndexPath;
  self->_shiftedIndexPath = v5;

  -[MTIndexPathShifter setIsComplete:](self, "setIsComplete:", 0);
}

- (void)processChangeAtIndexPath:(id)a3 forChangeType:(unint64_t)a4 newIndexPath:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  MTIndexPathShifter *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter shiftedIndexPath](self, "shiftedIndexPath"));
  v10 = objc_msgSend(v9, "section");
  v11 = objc_msgSend(v20, "section");

  if (v10 == v11 && !-[MTIndexPathShifter isComplete](self, "isComplete"))
  {
    switch(a4)
    {
      case 3uLL:
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter initialIndexPath](self, "initialIndexPath"));
        v17 = objc_msgSend(v20, "isEqual:", v16);

        if (!v17)
        {
          -[MTIndexPathShifter processChangeAtIndexPath:forChangeType:newIndexPath:](self, "processChangeAtIndexPath:forChangeType:newIndexPath:", v20, 2, 0);
          -[MTIndexPathShifter processChangeAtIndexPath:forChangeType:newIndexPath:](self, "processChangeAtIndexPath:forChangeType:newIndexPath:", 0, 1, v8);
          goto LABEL_3;
        }
        -[MTIndexPathShifter setShiftedIndexPath:](self, "setShiftedIndexPath:", v8);
        break;
      case 2uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter initialIndexPath](self, "initialIndexPath"));
        v19 = objc_msgSend(v18, "row");

        if (objc_msgSend(v20, "row") != v19)
        {
          if (objc_msgSend(v20, "row") >= v19)
            goto LABEL_3;
          v14 = self;
          v15 = -1;
          goto LABEL_17;
        }
        -[MTIndexPathShifter _setIndexPath:](self, "_setIndexPath:", 0x7FFFFFFFFFFFFFFFLL);
        break;
      case 1uLL:
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter initialIndexPath](self, "initialIndexPath"));
        v13 = objc_msgSend(v12, "row");

        if (objc_msgSend(v8, "row") > v13)
          goto LABEL_3;
        v14 = self;
        v15 = 1;
LABEL_17:
        -[MTIndexPathShifter _shiftIndexPath:](v14, "_shiftIndexPath:", v15);
        goto LABEL_3;
      default:
        goto LABEL_3;
    }
    -[MTIndexPathShifter setIsComplete:](self, "setIsComplete:", 1);
  }
LABEL_3:

}

- (void)_shiftIndexPath:(unint64_t)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter shiftedIndexPath](self, "shiftedIndexPath"));
  -[MTIndexPathShifter _setIndexPath:](self, "_setIndexPath:", (char *)objc_msgSend(v5, "row") + a3);

}

- (void)_setIndexPath:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter shiftedIndexPath](self, "shiftedIndexPath"));
  v6 = objc_msgSend(v5, "row");

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MTIndexPathShifter shiftedIndexPath](self, "shiftedIndexPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, objc_msgSend(v8, "section")));
    -[MTIndexPathShifter setShiftedIndexPath:](self, "setShiftedIndexPath:", v7);

  }
}

- (NSIndexPath)initialIndexPath
{
  return self->_initialIndexPath;
}

- (NSIndexPath)shiftedIndexPath
{
  return self->_shiftedIndexPath;
}

- (void)setShiftedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_shiftedIndexPath, a3);
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftedIndexPath, 0);
  objc_storeStrong((id *)&self->_initialIndexPath, 0);
}

@end
