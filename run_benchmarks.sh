for i in {1..64}
do
	echo "---"
	echo "> tweet, $i threads"
	erl +S $i -noshell -s benchmark test_tweet -s init stop > output-tweet-$i.txt
	echo "---"
	echo "> get_tweets, $i threads"
	erl +S $i -noshell -s benchmark test_get_tweets -s init stop > output-get_tweets-$i.txt
	echo "---"
	echo "> get_timeline, $i threads"
	erl +S $i -noshell -s benchmark test_get_timeline -s init stop > output-get_timeline-$i.txt
done

