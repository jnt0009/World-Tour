## Dependencies
library(maps)
library(htmltools)
library(magrittr)
library(leaflet)
library(jpeg)
print('Source loaded')
## Master table
tbl <- data.frame(location = 
                    c('Lisbon','Auburn','Denver','Charlotte','Charleston','Atlanta',
                      'Boston','Birmingham','New Orleans','Nashville'),   ## Names of the places 
                  long = 
                    c(-9.1393,-85.4808,-104.990251,-80.84312669,-79.931051,-84.3879,
                      -71.0588,-86.8024,-90.07153,-86.7816),  ## Longitudes
                  lat = 
                    c(38.7223,32.6099, 39.7392358,35.2270869,32.7764,33.74899,
                      42.3600,33.5206,29.951065,36.1627),  ## Latitudes
                  img = 
                    c('https://scontent-sjc3-1.cdninstagram.com/vp/e0412fe37b4597e101b7204c683f01a8/5CC09B47/t51.2885-15/e35/31474763_169928560363569_1412119783033274368_n.jpg?_nc_ht=scontent-sjc3-1.cdninstagram.com',
                      'https://scontent-sjc3-1.cdninstagram.com/vp/e726aa0db288ad910075b127566d2246/5CC19E5C/t51.2885-15/e35/29715477_362097407630697_8051176621693992960_n.jpg?_nc_ht=scontent-sjc3-1.cdninstagram.com',
                      'https://upload.wikimedia.org/wikipedia/commons/4/46/Flag_of_Colorado.svg',
                      'https://scontent-sjc3-1.cdninstagram.com/vp/ba4bdb565f24e975598e82d22d52942f/5CC4CF24/t51.2885-15/sh0.08/e35/c180.0.720.720/s640x640/43718964_142516070041790_4221166199350757311_n.jpg?_nc_ht=scontent-sjc3-1.cdninstagram.com',
                      'https://instagram.fatl1-2.fna.fbcdn.net/vp/0363dbc537f732545d41de4869b86e4d/5C33F628/t51.2885-15/e35/30589836_2037157493163258_5007129309547069440_n.jpg',
                      'https://scontent-ort2-2.cdninstagram.com/vp/98123ec7496ff8b08a7323dd3f0dfc33/5C60DE6D/t51.2885-15/e35/40046882_265492014288654_2495711985677631488_n.jpg',
                      'https://scontent-sjc3-1.cdninstagram.com/vp/5e775ea924c5d73ffe908383a17d82ae/5CBB7EE0/t51.2885-15/e35/37999386_860928457440577_1173878303606439936_n.jpg?_nc_ht=scontent-sjc3-1.cdninstagram.com',
                      'https://scontent-sjc3-1.cdninstagram.com/vp/341368ecd4bb3fee6e48a9c8ba05a0cd/5CB6AD1F/t51.2885-15/e35/46743467_210773916518367_8972758672737390528_n.jpg?_nc_ht=scontent-sjc3-1.cdninstagram.com',
                      'https://instagram.fatl1-2.fna.fbcdn.net/vp/f23bdab34a195ea6fc2840b1fceba07c/5C3B4398/t51.2885-15/e35/36041194_2202987703255751_5754022086506971136_n.jpg',
                      'https://scontent-sjc3-1.cdninstagram.com/vp/d7eee041a6e79434314da9b3b73f63a9/5CB5295B/t51.2885-15/sh0.08/e35/c96.0.887.887a/s640x640/46553458_2237387886505303_694434473532387769_n.jpg?_nc_ht=scontent-sjc3-1.cdninstagram.com' 
                  ),  ## Photos 
                  copy = 
                    c('I was blessed to be able to spend a week in Lisbon,Portugal this year.',
                    'As an Auburn Alum I have made the trip from Atlanta to Auburn many of times, but never in this much style.',
                    'This was my first trip to "the Mile High City", but any place with great hiking and even better breweries is ok in my book',
                    'I was lucky enough to clelebrate Minnesota and Amandas wedding in Charlotte this year. Congratulations guys!',
                    "This trip was the first time I have experienced my fraternity's district convention as an alumni.  After a year of hosting and another year as an officer it was far more relaxed experience.",
                    'So this one is a bit of a cheat since I live in Atlanta, but I planned to travel to whatever bowl game Auburn was playing in.  This just happened to be in Atlanta. ',
                    'As a long time Redsox fan a game at Fenway park has been on my bucket list for years.  This year I finally made it happen.',
                    'It was nice to be in Birmingham for another HERD wedding Congratulations!',
                    "New Orleans may be my favorite city in the world between the food and music it's always a great time.",
                    "This trip to Nashville was definitley punctuated by the Tigers demolishing Purdue in the Music City Bowl. Ware Eagle!"
                    )
                  ## Text
                )


