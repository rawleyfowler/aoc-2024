#!/usr/bin/env perl

use strict;
use warnings;
use List::Util qw(reduce zip all);

my ( @a, @b );
my $i = 0;
while (<DATA>) {
    ( $a[$i], $b[$i] ) = split '   ';
    $i++;
}
my @m = zip [ sort @a ], [ sort @b ];
my $d = reduce { $a + abs( $b->[0] - $b->[1] ) } 0, @m;
CORE::say 'Part 1: ', $d;

my $td;
for my $c (@a) {
    $td += $c * scalar( grep { $c == $_ } @b );
}
CORE::say 'Part 2: ', $td;

__DATA__
28186   35627
51854   34597
19211   51032
79370   53096
68126   40302
43284   25771
80565   99650
83151   70796
91092   74579
70740   98650
45166   53096
24309   45165
62950   26641
23291   91017
56683   53851
22308   81625
83150   34155
87443   91017
56834   91784
35159   67595
10722   83450
92257   23419
15995   96671
89901   39216
25104   76669
37075   56652
15874   66083
33493   35627
87420   31838
11269   91386
92604   83450
34888   99650
49759   40926
38211   27379
93866   22096
88205   66217
55772   60776
83556   78255
22292   50829
22487   78358
27260   79702
74570   90319
27532   14353
40720   67595
99885   65688
25733   53752
12466   14411
88402   40165
63328   13804
45165   62461
24913   94225
32251   76669
91004   40165
48939   45165
98082   34561
74569   42932
99641   54600
42748   22021
23376   54490
38706   69865
64985   87783
14431   78715
37671   94814
27425   60776
21801   76669
96975   33493
56680   31838
41265   71129
99081   32487
53077   82615
54490   55624
22649   60776
82601   25943
93133   96412
77182   78358
67827   76838
45976   89107
20352   89034
28891   23800
87739   76669
47802   99650
18060   28437
65882   93980
53343   13764
84301   93604
62547   93479
79067   45165
70139   54490
28158   76669
71631   39775
36521   57540
78928   37888
75943   39076
28462   60107
95828   94225
49768   73181
40545   97945
18963   74260
17934   63046
73054   13454
43170   60924
90257   28180
99765   33493
41380   50296
24225   62945
66579   73961
73361   54622
26339   91017
84080   62041
89322   54600
84610   18344
58420   87051
12253   83450
25631   91017
71764   63533
52908   40165
56578   46636
99876   61946
43934   64469
78242   11111
97629   28916
21477   91017
97639   64456
90978   53077
94412   73836
49249   96113
92750   14411
12961   13764
84319   22230
83435   78146
48951   86109
40258   13764
54600   65577
51432   53096
11527   20394
68196   94225
14939   91017
13158   39216
62120   93587
20939   71764
58436   28038
37198   31838
59152   17554
52958   44145
64236   18285
63763   56578
40304   99650
86564   78910
45684   52760
43139   61946
99974   76669
44698   86004
19940   22021
29106   78358
60431   91386
50880   76451
96595   42193
40966   73961
64515   61946
31081   39834
87614   70892
82663   54622
73537   62994
14125   56652
51361   35627
26084   35817
82915   20069
72409   22021
22834   20071
93476   83787
63719   53096
41505   48056
56055   20404
37255   99650
33468   60776
70472   22598
66290   53077
91071   67595
30888   33173
60826   29871
12334   78358
62744   69424
85449   79500
22333   16295
67621   18455
12605   90059
32490   25835
96639   75870
82412   39747
76964   60153
60776   60776
68837   39216
35635   67595
85239   14964
15278   83450
63581   35178
77006   18285
88570   80424
61499   81689
57466   47392
78524   84304
11821   53989
62425   28916
36264   50872
38567   13061
16357   45165
17202   94451
64290   31838
76075   55071
87325   40165
93961   99650
49866   65601
91725   14411
44721   18285
44065   33493
22521   56578
28070   54600
45621   54600
54677   26913
79647   24298
89613   31415
86493   13764
16243   64218
12832   21187
43847   35189
75859   54600
69276   75826
43251   14411
96012   41446
35482   35817
45380   82383
66801   31838
79199   92341
33087   70511
40619   28916
67655   80670
22431   60776
62731   54622
29873   25771
99354   63481
36415   61946
29742   94919
64872   53077
93028   55635
32784   18285
87488   68734
56652   18285
49968   80712
82653   53096
30377   24784
40120   45165
88404   70120
69179   45165
99645   67595
44883   45165
76320   43595
29057   90019
28502   61946
73459   84304
96354   54622
77589   14301
51381   54490
40490   95808
36023   27135
13434   63807
27250   35627
13764   32845
28229   34954
56430   76669
98593   63811
11192   60776
81601   72265
86908   77116
25484   82383
31115   42206
75124   70148
96785   53096
59814   85995
17024   57255
81701   41971
43938   33493
91646   33599
96616   81828
73270   87775
75876   35817
53007   83450
39527   33975
35936   17039
95194   23302
96876   80147
68136   91386
31253   19760
98767   61208
98353   86604
13239   36264
43374   13764
36658   22965
58030   84304
42686   78358
99419   49423
43976   20759
33361   47852
23794   61946
26896   83450
12213   37740
53827   49270
71874   61946
19394   77889
63728   81025
63780   72467
34161   21317
81832   56652
20986   99650
36631   48302
60232   63009
37744   84304
46964   39391
19771   14411
75783   69365
71727   71252
60541   69095
68594   30949
51619   88697
26797   50216
86654   61946
98872   53347
20079   18807
60408   41952
37203   47862
92078   43717
94853   53096
91937   65490
39800   79198
14179   50429
21846   72768
19081   14411
60170   39838
14482   36264
61946   64811
88464   10899
93401   44867
42260   53495
92730   76838
17708   31838
68523   99650
44540   95629
12785   54490
34598   13764
20161   28916
15318   67595
67423   47864
13951   95495
63011   67595
73505   61946
22300   73685
35181   78358
70531   60776
95954   57049
65463   67851
67270   53593
62726   13782
66690   72865
99591   33493
89300   13764
82383   51267
55326   56578
66315   54622
51554   91145
21778   67595
38569   71437
25915   80353
92411   88336
76148   83204
68688   61443
78063   34003
27804   14411
79316   59050
14222   22021
83018   18197
36304   33795
46381   78358
23167   99650
73696   11314
83569   71391
93902   76551
33606   35906
30257   54600
24956   80860
64619   14411
17640   56652
22908   83696
18954   74347
89497   83450
70303   76669
37979   69814
22661   53077
96573   83961
13055   85059
73265   67595
31927   45165
61607   54490
62232   53096
68738   79113
50586   95006
55731   39122
33386   31838
20118   97657
98794   76669
62869   57813
45508   91386
29960   56652
20228   95663
75424   74090
75421   30158
82307   11086
26488   64910
48430   41174
81439   63107
68896   56652
67511   33375
40446   66170
13668   68369
83234   16181
16929   84304
42735   85915
93954   22403
98252   33493
39418   54622
14183   89745
67167   68002
88731   22021
42317   54490
29404   83450
80844   31838
43255   34866
61762   32538
32255   78358
93152   25771
42141   56578
83740   22021
40030   47353
34668   14411
46752   21905
26196   48915
45243   67595
26757   56652
13969   82383
13148   84304
39362   29711
92819   31171
12210   14411
58671   91017
87279   62713
97755   92124
77086   62944
87094   40099
83398   35817
36525   64734
27346   36264
50274   17587
74438   92593
86182   13764
63946   56578
99269   25771
46815   67595
44645   93146
82027   25771
46981   39216
52039   31814
25930   54600
48743   31838
80123   72281
21790   84579
91556   78358
63961   14411
11280   97891
67372   60776
35817   34731
80767   53877
32458   90108
53471   13557
76699   92723
33967   31838
83166   23325
48974   44826
28408   16412
18980   61946
76595   21581
54278   82835
57836   67595
16791   84304
52746   99650
23543   83450
28819   95078
21590   84304
90588   91017
62879   43669
35788   81389
67595   91386
43342   73961
34072   73961
41533   54487
77769   71151
95215   74006
37630   44436
85291   18292
82845   99650
56633   60776
95645   54490
59689   14411
77873   23174
47892   94225
71442   77808
52932   56578
68699   56652
70296   54600
34780   50848
14008   63408
65865   73961
64689   84695
70986   45490
20034   54600
21194   73961
42510   37716
80906   32357
38289   19304
44371   53386
45873   95639
72359   53096
26200   40165
81093   32591
75520   99689
70526   92020
38000   90543
42109   40526
65858   64811
77533   83450
84191   63489
59480   46311
20750   32879
81791   76258
49948   56739
44960   22021
49084   12978
46948   25438
22467   39216
32066   41311
47715   13764
40689   56652
81797   82792
48102   91114
13286   64910
24324   81079
14772   91386
10721   20481
26990   54622
67169   22021
42848   25771
24672   13764
86122   25771
56904   13764
81436   53096
94624   33493
91853   56652
23675   14088
26625   68877
22777   53096
44833   33493
47549   96449
79529   27951
78188   99650
16287   51001
64231   25771
84131   55907
15378   41016
69506   78358
80392   64811
68681   57430
95565   40165
27128   40839
11911   38020
32463   95974
64051   39216
59409   25771
85311   99650
15025   76669
31085   83450
57046   43589
31356   25944
53445   32566
65374   24456
94347   17250
51998   76838
38930   76838
13223   22328
23412   33493
33498   39216
66922   97888
19340   13764
30800   33625
63834   53077
26329   76669
36202   52321
99460   87180
10752   22155
83677   54586
83136   94225
43505   94775
49792   51024
18430   87697
48959   62169
27559   86092
42055   71266
47346   27875
95130   15327
67175   50520
80717   48669
98758   93010
69621   73606
25596   22021
37015   83450
14944   93706
70867   84304
14464   80652
11365   25771
78435   46797
45002   58808
57900   83487
99650   55843
80681   38011
64811   86071
97586   33898
42094   41087
76669   54622
74600   28060
18109   25771
95834   40165
76583   32274
23271   54600
73123   81744
81442   70437
97274   25771
99106   91717
19847   39216
41705   54622
97824   64338
34982   39216
47246   58999
94716   78358
52266   60776
39216   95154
49351   94864
64910   39559
43455   84248
71500   27152
30651   49103
63267   44712
17567   18998
63046   48579
51483   63529
35182   14411
73961   60776
39993   30182
26258   96243
52698   77762
21525   22021
47513   20331
13140   22021
43778   40165
22788   94225
84367   31838
54265   64910
55305   42377
78923   54586
40429   39216
12422   63046
24878   94225
64356   57593
34812   40889
54661   60776
31004   55132
38061   63046
85827   35627
72862   33704
51636   98691
15448   54159
90048   67595
53851   18285
48530   74924
20386   81637
87273   53096
83022   56018
98251   65250
89295   60776
98142   15765
31571   42354
92874   70979
44965   58401
51688   78358
93890   12104
65530   53096
55006   91017
49672   55977
31815   37826
13567   58321
60844   53077
63845   26325
98712   79314
99601   63236
14173   60776
11249   86708
37023   48603
25248   14411
25444   63817
92822   10083
43060   41903
98283   89972
10004   77190
69379   56652
30459   45165
81481   18285
47130   24016
57377   56872
24043   63046
78319   33493
96058   33493
42928   32466
76838   35627
43659   76669
36827   39216
41007   60776
79655   14411
26608   44836
85420   68185
81174   96069
79223   59880
54106   52192
71917   83450
19775   73961
45391   66102
26838   33493
53437   76669
71922   91017
67552   40770
23842   12889
75398   90858
20264   96094
38278   39216
62780   68287
92766   45165
25677   23355
55791   83450
63556   93703
97511   61946
74712   18285
34605   15067
57436   56652
91202   91017
11656   54622
31838   22156
94443   25771
84090   60590
63298   91386
60339   56419
25780   53096
55284   76669
83080   71920
53843   36881
83616   42743
89091   68085
71899   31838
57786   67595
34559   96506
77211   94225
67812   61946
26511   63739
51963   97847
81350   23053
37978   57093
93413   89804
38133   60776
73234   84629
60624   31957
13937   34269
35804   44626
36210   53096
34190   33493
30736   83057
80091   23762
60917   82383
30227   53096
94439   56652
78308   67595
51009   67595
64010   53077
20563   61946
43967   17312
86436   75180
80389   42825
94453   83450
41805   91918
21462   99650
71157   10537
35046   73961
96103   74733
83069   35732
18285   82383
26446   76669
70874   18579
10539   11666
57999   83450
25966   91017
37570   93089
46126   18897
65025   78341
48404   61946
26116   91017
84857   33493
84369   96112
79609   76561
24415   76669
55288   37007
85869   10010
15152   76669
10609   52954
56293   59754
35563   99650
15144   32125
27560   33493
10484   99261
73264   74795
44774   17094
41294   53851
14411   83990
17065   25771
25771   60026
58907   16393
93527   90760
25715   68223
61620   23456
36485   15169
70191   39216
40165   94225
54006   99650
75597   53096
49678   25771
51574   96842
57852   18285
60104   61946
78607   35627
54889   14411
47241   10303
71456   94225
81425   49149
59061   28602
24633   31838
14420   93613
54622   53077
17040   78745
70622   88133
56992   72730
97895   33493
94648   44310
59138   13764
97350   69918
32734   83579
55320   66823
96915   55216
95293   38588
13774   12822
70053   58437
22021   18724
41216   43315
28987   31838
70488   89770
48277   53914
79376   76669
94225   53077
60803   12578
21144   16837
23645   33714
28916   83751
50535   31838
62178   64811
63126   71848
33569   46461
99826   53077
74714   33856
67967   26838
83610   54622
15872   36009
34302   31838
24069   56292
90147   38554
95987   79195
62656   40165
83153   26094
68726   85767
63172   74949
35390   94225
29379   63046
13571   56578
16169   64811
68905   35817
71763   53096
48781   28841
95966   15028
87862   67072
87176   60776
11203   13761
50294   11171
21503   25547
96570   78358
25213   84422
61744   85120
62795   72393
84907   33493
82935   84304
24224   36264
91386   99650
76217   98074
73872   60776
41777   19177
95695   39216
88779   15111
93458   67595
74732   67770
23754   39216
90662   35817
24013   99650
66779   83450
54586   27524
88285   69874
47809   22021
25662   71764
31583   56652
58156   60776
22656   56578
22315   76174
70195   54622
27027   33351
32409   75991
91017   72493
53096   13301
92656   41863
84304   85568
45081   73961
21844   78358
83024   61946
93888   45113
69174   53096
98465   56543
46208   56652
63289   99650
96607   76329
62648   55561
38090   62481
87491   90246
45019   81753
88050   73961
18142   26270
36682   22021
15933   94225
17393   38533
33633   67595
55662   73961
63567   74739
69557   83450
36169   25771
40716   35837
11665   14704
94437   36515
43859   18285
98937   54490
73932   94209
99289   50655
12403   22021
80283   64811
68700   43336
36887   69617
53551   83450
76290   18285
49743   25771
35627   76669
59070   13231
40419   24169
48544   82383
68680   84304
31610   58761
31170   67595
27004   41596
62727   98757
24189   76875
42807   97581
85552   71764
52402   40046
78358   41164
83450   76669
62947   25771
55820   53096
